From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: kernel helper modules parameters
Date: Wed, 08 Feb 2012 03:11:15 +0000
Message-ID: <4F31E7D3.5060203@googlemail.com>
References: <4F31B772.2040102@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=MpDfoWetDgaqFXD7hbLYNrtpukn+nB8/991rytxaAW0=;
        b=plTzrWesAdKsh499Fp7d1LpRJsmvnFMnOyVtMFDFKlbpUhHfA71jr4UUUtYgX08Q4J
         nsx27lbt0q6ls3p5vT4fBbPBLdFAKJRSDU//MW1+OObm3ouVUe05txBBfAkkqHm4Qt+A
         LERUBP6DSM4vTud2XK5ghYDSfvLiobCnIHTas=
In-Reply-To: <4F31B772.2040102@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


> I would like to do some testing with the (t)ftp, sip, h323 and 
> possibly netbios_ns module helpers. I am most definitely not going to 
> use the standard ports these protocols operate on, so need to know, 
> among other things, how can I reconfigure the helpers and the degree 
> of leverage I have (i.e. what I can/cannot get away with). Thanks.
-bash~# ipset n test hash:ip family inet timeout 0 hashsize 128
-bash~# ipset a test 10.99.99.1
-bash~# iptables -A OUTPUT -t raw -p tcp --dport 17021 -m set 
--match-set test dst -j CT --helper ftp
-bash~# iptables -t raw -L OUTPUT -vn
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination        
    0     0 CT         tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           tcp dpt:17021 match-set test dst CT helper ftp
-bash~# iptables -D OUTPUT -t raw -p tcp --dport 17021 -m set 
--match-set test dst -j CT --helper ftp
-bash~# ipset x test
-bash~# ipset n test hash:ip,port family inet timeout 0 hashsize 128
ipset a test 10.99.99.1,tcp:17021
-bash~# iptables -A OUTPUT -t raw -m set --match-set test dst,dst -j CT 
--helper ftp
*iptables: No chain/target/match by that name.*
-bash~# iptables -A OUTPUT -t raw -p tcp -m set --match-set test dst,dst 
-j CT --helper ftp
-bash~# iptables -t raw -L OUTPUT -vn
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination        
    0     0 CT         tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           match-set test dst,dst CT helper ftp
-bash~# iptables -A OUTPUT -t raw -p udp -m set --match-set test dst,dst 
-j CT --helper ftp
*iptables: No chain/target/match by that name.*

Anyone kind enough to enlighten me why do I have to specify a protocol 
(which matches the ipset type exactly!) in order for iptables to accept 
and create that rule? For the filter table there is no such constraint.
