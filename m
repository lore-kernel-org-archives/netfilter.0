From: Sascha Frey <sf@TechFak.NET>
Subject: conntrackd: inject-add2: Invalid argument
Date: Thu, 10 Jul 2014 17:00:06 +0200
Message-ID: <20140710150006.GB9616@TechFak.Uni-Bielefeld.DE>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

I did set up conntrackd in sync mode on two firewall hosts.

I get a lot of errors in the log:

conntrack-tools[6607]: inject-add2: Invalid argument
conntrack-tools[6607]: tcp      6 ESTABLISHED src=yyy.yyy.yyy.55 dst=10.255.255.1 sport=51505 dport=22 [UNREPLIED]
conntrack-tools[6607]: inject-upd1: Invalid argument
conntrack-tools[6607]: tcp      6 FIN_WAIT src=yyy.yyy.yyy.55 dst=10.255.255.1 sport=51505 dport=22 [UNREPLIED]
conntrack-tools[6607]: inject-add2: Invalid argument
conntrack-tools[6607]: tcp      6 ESTABLISHED src=yyy.yyy.yyy.55 dst=10.255.255.1 sport=51505 dport=22 [UNREPLIED]

Any idea what's wrong here?

Both machines run Debian Wheezy with backports kernel
(3.14.7-1~bpo70+1) and conntrackd (1.2.1-1).


My conntrackd.conf:

Sync {  
        Mode FTFW {
                DisableExternalCache On
                CommitTimeout 1800
                PurgeTimeout 5
        }
        
        # Dedicated link
        UDP Default {
                IPv4_address 192.168.109.2
                IPv4_Destination_Address 192.168.109.3
                Port 3780 
                Interface bond1 
                SndSocketBuffer 134217728
                RcvSocketBuffer 134217728
                Checksum on
        }
        
        # Fallback
        UDP {   
                IPv4_address xxx.xxx.xxx.162
                IPv4_Destination_Address xxx.xxx.xxx.163
                Port 3780 
                Interface bond0 
                SndSocketBuffer 134217728
                RcvSocketBuffer 134217728
                Checksum on
        }
}

General {
        Nice -20 
        HashSize 262144
        HashLimit 1048576
        LogFile off
        Syslog local6
        LockFile /var/lock/conntrackd.lock
        UNIX {  
                Path /var/run/conntrackd.sock
                Backlog 20
        }
        SocketBufferSize 16777216
        SocketBufferSizeMaxGrown 67108864
        
        Filter From Kernelspace {
                Protocol Accept {
                        TCP
                        UDP
                        ICMP
                }
                
                Address Ignore {
                        IPv4_address 127.0.0.k
                        IPv6_address ::1 # loopback
                        
                        IPv4_address xxx.xxx.xxx.160/28
                        IPv4_address 192.168.109.0/24
                }
        }
}

Cheers,
Sascha
