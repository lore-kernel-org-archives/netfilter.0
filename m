From: md@Linux.IT (Marco d'Itri)
Subject: conntrackd and CacheWriteThrough
Date: Wed, 29 Oct 2008 16:53:32 +0100
Message-ID: <20081029155332.GA20850@bongo.bofh.it>
Reply-To: netfilter@vger.kernel.org, md@linux.it
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

When I try to start conntrackd (0.9.6 and 0.9.7, from the Debian
packages), it dies with this message:

Error parsing config file: line (58), symbol 'CacheWriteThrough': syntax error

What's wrong?

I have a pair of firewalls running quagga and OSPF announcing the
network behind them to my network core and keepalived managing a
virtual gateway on it, so I need an active-active setup because
traffic can enter the protected network from any of the firewalls.

This is my configuration file:

#
# Synchronizer settings
#
Sync {
        Mode FTFW {
                #
                # Size of the buffer that hold destroy messages for 
                # possible resends (in bytes)
                #
                ResendBufferSize 262144

                #
                # Entries committed to the connection tracking table 
                # starts with a limited timeout of N seconds until the
                # takeover process is completed.
                #
                CommitTimeout 180

                # Set Acknowledgement window size
                ACKWindowSize 20
        }

        #
        # Multicast IP and interface where messages are
        # broadcasted (dedicated link). IMPORTANT: Make sure
        # that iptables accepts traffic for destination
        # 225.0.0.50, eg:
        #
        #       iptables -I INPUT -d 225.0.0.50 -j ACCEPT
        #       iptables -I OUTPUT -d 225.0.0.50 -j ACCEPT
        #
        Multicast {
                IPv4_address 225.0.0.50
                IPv4_interface 85.94.204.77 # IP of dedicated link
                Interface eth2
                Group 3780
        }

        # Enable/Disable message checksumming
        Checksum on

        # Uncomment this if you want to replicate just certain TCP states.
        # This option introduces a tradeoff in the replication: it reduces
        # CPU consumption and lost messages rate at the cost of having 
        # backup replicas that don't contain the current state that the active 
        # replica holds. TCP states are: SYN_SENT, SYN_RECV, ESTABLISHED,
        # FIN_WAIT, CLOSE_WAIT, LAST_ACK, TIME_WAIT, CLOSE, LISTEN.
        # 
        # Replicate ESTABLISHED TIME_WAIT for TCP
        Replicate ESTABLISHED TIME_WAIT

        # If you have a multiprimary setup (active-active) without connection
        # persistency, ie. you can't know which firewall handles a packet
        # that is part of a connection, then you need direct commit of
        # conntrack entries to the kernel conntrack table. OSPF setups must
        # set on this option. Default is Off.
        #
        CacheWriteThrough On
}

[...]

-- 
ciao,
Marco
