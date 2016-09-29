From: Thomas Stein <himbeere@meine-oma.de>
Subject: "PHYSDEV match --physdev-is-bridged" problems
Date: Thu, 29 Sep 2016 19:22:13 +0200
Message-ID: <b729277c49e4ce2724413efa4d3063c5@webmail.meine-oma.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_bd700b810ec6ac89ad0876c88f0c49b5"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=meine-oma.de; s=x; h=Message-ID:Subject:To:From:Date:
        Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bGeRjXkFzxVlWhxK5BK4t2tr0mYzGjjNfsosZCTQBPE=; b=DyF15geTqIIIudz0DarZEBAn7
        4/UNLNpHVMb0/2qCoHHsjmjDXUEH2OQ2S5mC9Yf3ptj9prBPw0+5VWEFNH03AxPTLhTe408kNjVBH
        A/PPVG/e/nJstP/j6o3LjTOsMvf+ZtBq+IwbeTvzdGYvgY1gvi/KT+OkwzpCcE6tGAPYI=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--=_bd700b810ec6ac89ad0876c88f0c49b5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

Hi Netfilter.

I'm facing a problem with setting up an iptables ruleset on a machine 
with a bridged interface.

hn2 ~ # brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.001e67d35bee       no              eth0
                                                         one-259-0
hn2 ~ #

What i'm trying to accomplish is firewall the interface one-259-0. But 
no matter what i'm trying there is no traffic
filtered. It goes just plain through. The effect stays same with or 
without:

hn2 ~ # cat /proc/sys/net/bridge/bridge-nf-call-iptables
1
hn2 ~ # cat /proc/sys/net/bridge/bridge-nf-call-arptables
1
hn2 ~ #

Here is the running ruleset. I hope someone can point me to the right 
direction.

hn2 ~ # iptables -nvL
Chain INPUT (policy ACCEPT 1003 packets, 86232 bytes)
  pkts bytes target     prot opt in     out     source               
destination
  6792  390K ACCEPT     tcp  --  *      *       nice.ip.yeah.right        
0.0.0.0/0            tcp dpts:5900:6999
     0     0 DROP       tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0            tcp dpts:5900:6999

Chain FORWARD (policy ACCEPT 435K packets, 472M bytes)
  pkts bytes target     prot opt in     out     source               
destination
    59  3323 opennebula  all  --  *      *       0.0.0.0/0            
0.0.0.0/0            PHYSDEV match --physdev-is-bridged
11975  685K LOG        tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0            tcp dpt:22 LOG flags 0 level 4

Chain OUTPUT (policy ACCEPT 877 packets, 141K bytes)
  pkts bytes target     prot opt in     out     source               
destination

Chain one-259-0-i (1 references)
  pkts bytes target     prot opt in     out     source               
destination
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0            state RELATED,ESTABLISHED
     0     0 RETURN     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0            multiport dports 22
     0     0 RETURN     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0            multiport dports 443
    58  2944 DROP       all  --  *      *       0.0.0.0/0            
0.0.0.0/0

Chain one-259-0-o (1 references)
  pkts bytes target     prot opt in     out     source               
destination
     0     0 DROP       all  --  *      *       0.0.0.0/0            
0.0.0.0/0            MAC ! 02:00:2E:04:94:D8
     1   379 ACCEPT     udp  --  *      *       0.0.0.0              
255.255.255.255      udp spt:68 dpt:67
     0     0 DROP       all  --  *      *       0.0.0.0/0            
0.0.0.0/0            ! match-set one-259-0-ip-spoofing src
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0            state RELATED,ESTABLISHED
     0     0 RETURN     all  --  *      *       0.0.0.0/0            
0.0.0.0/0
     0     0 DROP       all  --  *      *       0.0.0.0/0            
0.0.0.0/0

Chain opennebula (1 references)
  pkts bytes target     prot opt in     out     source               
destination
     1   379 one-259-0-o  all  --  *      *       0.0.0.0/0            
0.0.0.0/0            PHYSDEV match --physdev-in one-259-0 
--physdev-is-bridged
    58  2944 one-259-0-i  all  --  *      *       0.0.0.0/0            
0.0.0.0/0            PHYSDEV match --physdev-out one-259-0 
--physdev-is-bridged
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0
hn2 ~ #

Just to sum that up. I just wanna traffic on port 22 and 443 passed to 
the bridge member one-259-0. But at the moment i can connect to port 80 
fine.

thanks and cheers
t.
--=_bd700b810ec6ac89ad0876c88f0c49b5
Content-Transfer-Encoding: 7bit
Content-Type: application/pgp-keys;
 name=0xF5437AA0.asc
Content-Disposition: attachment;
 filename=0xF5437AA0.asc;
 size=5263

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=2FIa
-----END PGP PUBLIC KEY BLOCK-----

--=_bd700b810ec6ac89ad0876c88f0c49b5--
