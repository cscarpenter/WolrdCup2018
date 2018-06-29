# Import Libraries
import pandas as pd
from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt

# Set the dimension of the figure
my_dpi = 125
plt.figure(figsize=(2600 / my_dpi, 1800 / my_dpi), dpi=my_dpi)

# Import data
data = pd.read_csv('player_teams2.csv', sep=",")

# Make the background map
m = Basemap(llcrnrlon=35, llcrnrlat=-40, urcrnrlon=180, urcrnrlat=90)
m.drawmapboundary(fill_color='#A6CAE0', linewidth=0)
m.fillcontinents(color='grey', alpha=0.3)
m.drawcoastlines(linewidth=0.1, color="white")

# Prepare a color for each point depending on the federation.
data['labels_enc'] = pd.factorize(data['homecontinent'])[0]

# Add a point per home ground
m.scatter(data['homelon'], data['homelat'], s=data['n'] / 0.025, alpha=0.4, c=data['labels_enc'], cmap="Dark2")

#  info and title
plt.text(36, -39,
         'Where 2018 FIFA World Cup Player\'s Play Football - ASIA\nBased on player\'s home grounds\n\nData Collected from Wikipedia',
         ha='left', va='bottom', size=12, color='#777777')

# Save 
plt.savefig('world_cup_2018_player_homegrounds_AFC.png', bbox_inches='tight')
