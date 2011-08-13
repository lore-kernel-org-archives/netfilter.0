From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: about merging fuzzy and connlimit ??
Date: Sat, 13 Aug 2011 13:29:09 -0400
Message-ID: <A3CB20A48B9548CAA18697411A3D2402@poweredge1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

That's correct?





# Create average

iptables -N average

# Restrict the number of parallel connections per client IP

iptables -A average -m connlimit --connlimit-above 20 -j REJECT

# Traffic rate control above the lower limit per client IP

iptables -A average -m connlimit ! --connlimit-above 20 \
-m fuzzy --lower-limit 100 --upper-limit 1000 -j REJECT

# Allow the traffic below the lower limit per client IP

iptables -A average -m connlimit ! --connlimit-above 20 -j ACCEPT


thanks,
julio
