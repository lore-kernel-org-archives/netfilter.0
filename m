From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 12:16:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409FB903.1090005@pbl.ca>
References: <1084206191.409fac6f1176a@webmail.floog.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084206191.409fac6f1176a@webmail.floog.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: michael@floog.net
Cc: netfilter@lists.netfilter.org

michael@floog.net wrote:
> Hi Group:
> But I don't know how to craft a rule that allows only some machines to
> send/receive data packets to/from *.9 while blocking other machines'
> access to *.9 on the LAN.

Machines on LAN talk directly to each other.  Those packets do not go 
through your firewall, so you can't block them there.

There are two solution to your problem:

If 192.168.1.9 is a Linux box, configure Netfilter on it so that 
anything not from 7 or 8 is dropped.

Second solution would be to put new server onto separate LAN. 
192.168.1.9 will become 192.168.2.9 (or whatever).  Than clients on your 
first LAN (192.168.1.0/24) will have to talk to your firewall/router to 
get to the server on your second LAN (192.168.2.0/24).

You will need one more ethernet card for second solution.  If additional 
server is going to be the only host in second LAN, you can connect it 
directly with cross over cable.  If you are going to add more servers to 
second LAN, you will also need additional hub or switch (do not connect 
two LANs into same hub).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

