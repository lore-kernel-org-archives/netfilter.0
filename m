From: Verachten Bruno <gounthar@gmail.com>
Subject: Is it possible to get a transparent proxy with Redsocks when using
 the new nftables?
Date: Tue, 3 Mar 2020 15:27:25 +0100
Message-ID: <CACtV=deJ2Sfq1q0r=MYvFOyh9B0UHkRTTnCYPW4yxMVfGLJyeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=aOgOiVsz9ie9a1lg+B3uk1FBJfYnsKar3Pj7h5K0PQs=;
        b=cN9ihmVy/KzUssxKN75ZZCRUh+sGEMAYe8cPscsDIldYe+DWh3pjxbX1cBijtQ752w
         YsqIAAGbZRa9AZx1UL8p4ZyWoq4g+W8CVF6uwMo1VQZctDb3893txXRxHwr/EkiQ83N2
         bq6x7gzmlVlJdrpzOkq0PZY/8Kzb54OCwh8gvn3YV5En82fEM/iU5sEIi/M7AfwqCThp
         nOUuN+EjgbkqMztglpMLRN/vT7u64/5f2lvrvKrCfjS14qj3xx2RdfcB73Vpy+TcD/p0
         S9VC/zI7VCJELMgJNtzDe60ZKjHHxMJ8YVw+RE45Nyig4zxF66H5rO3PUMoub8bBpQkV
         s15w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi List,

I hope I'm on the right list to ask that question. I'm not an expert
by any means on network, so please bear with me.

I've been using Redsocks for a few months now on a Ubuntu "18.04.3 LTS
(Bionic Beaver)" machine. This machine has iptables, and not nftables.
So I have a few rules to redirect 80,443,9048,1935 and so on.

sudo iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345
sudo iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDSOCKS
sudo iptables -t nat -A OUTPUT -p tcp --dport 1935 -j REDSOCKS
sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDSOCKS
sudo iptables -t nat -A OUTPUT -p tcp --dport 21 -j REDSOCKS
sudo iptables -t nat -A OUTPUT -p tcp --dport 11371 -j REDSOCKS
sudo iptables -t nat -A OUTPUT -p tcp --dport 9418 -j REDSOCKS
sudo iptables -t nat -A OUTPUT -p tcp --dport 6380 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 1935 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 21 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 11371 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 9418 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 9418 -j REDSOCKS
sudo iptables -t nat -A PREROUTING -p tcp --dport 6380 -j REDSOCKS

I exported those rules to another machine running "Debian GNU/Linux 10
(buster)", which has nftables. I converted the existing rules thanks
to

iptables-save > save.txt
iptables-restore-translate -f save.txt > ruleset.nft
nft -f ruleset.nft

Nothing seems to work, as a git command or anything else is just
falling in timeout.

Here is the configuration I get once the rules have been imported:

table ip filter {
        chain INPUT {
                type filter hook input priority 0; policy accept;
        }

        chain FORWARD {
                type filter hook forward priority 0; policy accept;
        }

        chain OUTPUT {
                type filter hook output priority 0; policy accept;
        }
}
table ip nat {
        chain PREROUTING {
                type nat hook prerouting priority -100; policy accept;
                meta l4proto tcp tcp dport 443 counter packets 0 bytes
0 jump REDSOCKS
                meta l4proto tcp tcp dport 1935 counter packets 0
bytes 0 jump REDSOCKS
                meta l4proto tcp tcp dport 80 counter packets 0 bytes
0 jump REDSOCKS
                meta l4proto tcp tcp dport 21 counter packets 0 bytes
0 jump REDSOCKS
                meta l4proto tcp tcp dport 9418 counter packets 0
bytes 0 jump REDSOCKS
                tcp dport https counter packets 0 bytes 0 jump REDSOCKS
                tcp dport 1935 counter packets 0 bytes 0 jump REDSOCKS
                tcp dport http counter packets 0 bytes 0 jump REDSOCKS
                tcp dport ftp counter packets 0 bytes 0 jump REDSOCKS
                tcp dport git counter packets 0 bytes 0 jump REDSOCKS
        }

        chain INPUT {
                type nat hook input priority 100; policy accept;
        }

        chain POSTROUTING {
                type nat hook postrouting priority 100; policy accept;
        }

        chain OUTPUT {
                type nat hook output priority -100; policy accept;
                meta l4proto tcp tcp dport 443 counter packets 0 bytes
0 jump REDSOCKS
                meta l4proto tcp tcp dport 1935 counter packets 0
bytes 0 jump REDSOCKS
                meta l4proto tcp tcp dport 80 counter packets 0 bytes
0 jump REDSOCKS
                meta l4proto tcp tcp dport 21 counter packets 0 bytes
0 jump REDSOCKS
                meta l4proto tcp tcp dport 9418 counter packets 0
bytes 0 jump REDSOCKS
                tcp dport https counter packets 0 bytes 0 jump REDSOCKS
                tcp dport 1935 counter packets 0 bytes 0 jump REDSOCKS
                tcp dport http counter packets 0 bytes 0 jump REDSOCKS
                tcp dport ftp counter packets 0 bytes 0 jump REDSOCKS
                tcp dport git counter packets 0 bytes 0 jump REDSOCKS
        }

        chain REDSOCKS {
                ip daddr 0.0.0.0/8 counter packets 0 bytes 0 return
                ip daddr 10.0.0.0/8 counter packets 0 bytes 0 return
                ip daddr 127.0.0.0/8 counter packets 0 bytes 0 return
                ip daddr 169.254.0.0/16 counter packets 0 bytes 0 return
                ip daddr 172.16.0.0/12 counter packets 0 bytes 0 return
                ip daddr 192.168.1.0/24 counter packets 0 bytes 0 return
                ip daddr 192.168.31.0/24 counter packets 0 bytes 0 return
                ip daddr 224.0.0.0/4 counter packets 0 bytes 0 return
                ip daddr 240.0.0.0/4 counter packets 0 bytes 0 return
                meta l4proto tcp counter packets 0 bytes 0 redirect to :12345
                counter packets 0 bytes 0 return
                ip daddr 10.0.0.0/8 counter packets 0 bytes 0 return
                ip daddr 127.0.0.0/8 counter packets 0 bytes 0 return
                ip daddr 169.254.0.0/16 counter packets 0 bytes 0 return
                ip daddr 172.16.0.0/12 counter packets 0 bytes 0 return
                ip daddr 192.168.1.0/24 counter packets 0 bytes 0 return
                ip daddr 192.168.31.0/24 counter packets 0 bytes 0 return
                ip daddr 224.0.0.0/4 counter packets 0 bytes 0 return
                ip daddr 240.0.0.0/4 counter packets 0 bytes 0 return
                ip protocol tcp counter packets 0 bytes 0 redirect to :12345
        }
}
table ip mangle {
        chain PREROUTING {
                type filter hook prerouting priority -150; policy accept;
        }

        chain INPUT {
                type filter hook input priority -150; policy accept;
        }

        chain FORWARD {
                type filter hook forward priority -150; policy accept;
        }

        chain OUTPUT {
                type route hook output priority -150; policy accept;
        }

        chain POSTROUTING {
                type filter hook postrouting priority -150; policy accept;
        }
}

Is there anything I'm missing?

Thanks.

-- 
Bruno Verachten
