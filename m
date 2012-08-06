From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: -f option used with iptables
Date: Mon, 6 Aug 2012 20:00:22 +0530
Message-ID: <CAE1WnGfTxjoEov7QCU0W32Z=Uy9y+rSEmCzZ94KiB0__AjSvmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=QAwULeGCVcxDTrEzOs89ndx3CGKjjqFMtiFQ3u3hUt8=;
        b=N97cCi3tk0ElB5zXAlwDEMg/ACHv3GNgoCqIlU14g/UyfA1maFXAoTdD+ew39vOMA3
         iS7cEg8SX5sV1I1PlcMhWdmQ73+Thk2f9VTdTR+F+QPRFCIhwnY/rwV09cq7kC/YfMZs
         MERwn+fef+VaUMapYyGkA1ZwLnNpUUq6JWuhlxE59XGK2piqV0vtNOwcjrOL0JDgRKbH
         wvrG9fNxyEh89XbPBK0j5EoZ/tNW8ar7U7cT5oTgJzAUAKdHWzt/8FP2FsTUqgmj+Fp1
         KwYc4oYEyDmY5RKqxx/PBjw7RwCNPJQo6VRDtJhvFMXPDyqpjJmt1U7WWND0JOHWGjve
         W0Fg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,

my objective is to drop all fragmented packets on my system
following rules are used

iptables -A INPUT -f -j DROP
iptables -A OUTPUT -f -j DROP
iptables -A FORWARD -f -j DROP

above rules are not making any effect
For information, there is no connection tracking support on my
kernel.Since i understand that if connection tracking is enabled on
kernel then filtering based on fragmentation won't work, so i have
remeved connection tracking support.

i have disable offloading parameters for NIC card

i am using ping -s 32768 10.2.2.2 for generating fragments

Am i doing something wrong
or is there anything  that is conflicting with these rules

Thanks in advance
