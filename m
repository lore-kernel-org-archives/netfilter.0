From: Julien Vehent <julien@linuxwall.info>
Subject: Using Netfilter with high bandwidth
Date: Fri, 31 Aug 2012 15:38:47 -0400
Message-ID: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1346441927;
	bh=358pafDZw563rkBGpXCqtiw2nGaTKHQ1c74UTybCLtg=;
	h=Date:From:To:Subject:From;
	b=EPWIZKAxrLpyr8Wqrbi3XD6RiBN7VllENfHV876hJqJCvReY7SaVnlnYY0ZlVJQBA
	 6BHEbJ4ATMeao7CpXZW0JmCUhIUp+458x2IUXZA2y5+ufb/awzd+/0ZfNkCFB2xw+7
	 ZcvFhL1NoYgQvgBlQwlBvVXCvIktDb+etXTYvZg8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hi All,

At work, we're building a new office, and we are considering building our 
own edge firewalls instead of giving bucket loads of money to the big guys. 
We're a Linux shop, so it makes sense to build those new firewall/vpn boxes 
using Linux. But we are concerned about performances and complexity. I make a 
simple diagram of what we want below. We would have a point to point WAN 
connection between the two networks, and then an uplink on each side.

So I figured I would ask the Netfilter heavy users:
  * How much traffic can we expect to route to a decently configured Firewall 
? Can we target 10GBPS with good NICs/CPUs and proper kernel tuning, or is 
that completely out of range ?
  * If I recall correctly, some ISPs are using Linux/Netfilter boxes on their 
network. Do we know the limits of such systems ?
  * Can we consider conntrack and conntrack synchronization between master 
and slave ?
  * What type of network cards will handle 1GBPS and 10GBPS (eventually) ? 
Any recommendation on the hardware ?
  * We are considering starting with a base ubuntu setup and then tuning the 
kernel/system to fit our needs. Some distros are more network oriented than 
others, is there anything that would stand out for our setup ?

Any pointer to tuning/recommendations is more than welcome. If you have 
experience with such a setup but don't want to share publicly, feel free to 
contact me directly.


                          ........... ...... ..........
                       ...      I N T E R N E T       ...
             +--------+..                               .+---------+
        500 MBPS          .............................            |500 MBPS
        UPLINK                                                     |UPLINK
             |                                                     |
        +----+-----------+             1 GBPS WAN        +---------+------+
        |                +------------------------------->                |
        | LAN FIREWALL   |---+                           | DATACENTER FW  
|---+
        +---^+-----------+   |                           +---^+-----------+   
|
            || +-------------+                               || 
+-------------+
            ||                                               ||
            ||                                               ||
            ||1 GBPS LAN                                     ||1 GBPS LAN
            ||                                               ||
            ||                                               ||
          ..+v....                                           |v......
        ..         ..                                       ..        ..
       ..   L A N   ..                                     .. Datacenter.
        .............                                       ...........


Thanks a lot everyone :)

Julien

-- 
Julien Vehent - http://jve.linuxwal.info
