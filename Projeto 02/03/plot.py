import re
import matplotlib.pyplot as plt
import numpy as np

def plot_drunkmen_with_visibility(filename):
    """Plot with better visibility for lower steps using alpha transparency"""
    
    with open(filename, 'r') as f:
        lines = f.readlines()
    
    # Colors and alphas - lower steps get higher opacity
    colors = ['red', 'orange', 'yellow', 'green', 'cyan', 'blue', 'purple']
    alphas = [1.0, 0.9, 0.8, 0.6, 0.6, 0.6, 0.6]  # Higher opacity for earlier steps
    sizes = [10, 35, 30, 25, 20, 15, 10]  # Larger points for earlier steps
    step_labels = ['1 passo', '10 passos', '100 passos', '1000 passos', '10000 passos', '100000 passos', '1000000 passos']
    
    # Prepare data
    generations = [[] for _ in range(7)]
    
    for line in lines:
        complex_numbers = re.findall(r'\(([^)]+)\)', line)
        
        if len(complex_numbers) >= 8:
            for gen in range(7):
                parts = complex_numbers[gen + 1].split(',')
                real = float(parts[0])
                imag = float(parts[1]) if len(parts) > 1 else 0.0
                generations[gen].append((real, imag))
    
    # Create the plot
    plt.figure(figsize=(14, 10))
    
    # Plot in reverse order so earlier steps are on top
    for gen in range(6, -1, -1):  # Reverse order: plot later steps first
        x_vals = [pos[0] for pos in generations[gen]]
        y_vals = [pos[1] for pos in generations[gen]]
        
        plt.scatter(x_vals, y_vals, color=colors[gen], alpha=alphas[gen], 
                   s=sizes[gen], label=step_labels[gen], edgecolors='none')
    
    plt.xlabel('Parte Real', fontsize=12)
    plt.ylabel('Parte Imaginária', fontsize=12)
    plt.title('Evolução dos Andarilhos', fontsize=14)
    plt.legend(fontsize=10)
    plt.grid(True, alpha=0.2)
    
    plt.savefig('drunkmen_visibility.png', dpi=300, bbox_inches='tight')
    plt.show()

plot_drunkmen_with_visibility('dados.txt')
