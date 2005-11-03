From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Re: Re: iptables problem (nfcan: addressed to exclusive
 (nfcan: addressed to exclusive sender for this address)	sender for
 this address)
Date: Thu, 03 Nov 2005 12:57:08 -0700
Message-ID: <436A6B94.6070305@pcraft.com>
References: <20051103062533.C48C96AA57@smtp.sterenborg.info>	<4369B1F2.50804@pcraft.com>
	<20051103152158.GA14687@salty>	<436A34B2.1080909@pcraft.com>
	<20051103170032.GE14687@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051103170032.GE14687@salty>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jim Laurino wrote:

> If the kiosks are ftp clients, the situation is entirely different.
> This should not be a problem.

    They are clients.  But...keep reading...  Something changed today.

> Exactly what do you mean when you say "contacts".
> Do you mean that the kiosk also must act as an ftp server?
> Or do you mean contact as in a passive ftp transfer?
> Passive ftp you can support via ftp helpers and RELATED.

    Neither.  It's through windows network shares.  The kiosk puts the 
order on it's local drive which is shared to the network, and the print 
station comes and fetches the info periodically.  Keep reading...


    I just got off the phone with the company and they made a small 
change in our config.  Now, all the kiosks have to do is connect via FTP 
to their server and drop a file.  That's it.  Nothing comes back, no 
inbound connections to the kiosks.  Just going out.

    So, just out of curiosity, I decided to try doing a manual FTP 
transfer from a completely different machine on the network.  One that 
CAN connect to external ftp sites just fine and transfer files.  And 
this is what I see:

    - Open DOS window
    - Connect to FTP server
    - enter 'PUT file.xml' command
    ...and that's where it hangs.

    Now, looking in the firewall logs, I see this:

Nov  3 13:47:19 serpico kernel: New not syn:IN=eth2 OUT=eth0 
SRC=192.168.1.253 DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 
ID=43803 DF PROTO=TCP SPT=4100 DPT=21 WINDOW=65420 RES=0x00 ACK PSH URGP=0

Nov  3 13:47:49 serpico kernel: New not syn:IN=eth2 OUT=eth0 
SRC=192.168.1.253 DST=206.112.90.196 LEN=40 TOS=0x00 PREC=0x00 TTL=127 
ID=43949 DF PROTO=TCP SPT=4100 DPT=21 WINDOW=0 RES=0x00 ACK RST URGP=0

Nov  3 13:47:55 serpico kernel: New not syn:IN=eth2 OUT=eth0 
SRC=192.168.1.253 DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 
ID=43987 DF PROTO=TCP SPT=4117 DPT=21 WINDOW=65338 RES=0x00 ACK PSH URGP=0

    In my DOS window, I see this (while those errors are popping up in 
syslog):

    ftp> put 2008701033.xml
            ... pause ... first error in syslog
            ... pause ... second line in syslog
    Connection closed by remote host.
            ... third line in syslog
    ftp>
   

    Please remember that this is a machine onto which I CAN open an ftp 
connection to anywhere in the world and be able to send and receive 
files just fine.  So then why is it not working when going to these people?

    ---- FIVE MINUTES LATER ----

    I just tried directly from the firewall machine and found out they 
don't allow PASSIVE mode ON... As soon as I turn passive mode off, the 
transfer, FROM THE FIREWALL MACHINE, works.  (firewall machine has an 
external IP)

    So now I wonder, is it because of the passive mode setting they 
have?  Could that be why ftp transfers from within the firewall fails?

-- 
W | It's not a bug - it's an undocumented feature.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / Websmith             .     800.441.3873 x130
  Photo Craft Laboratories, Inc.            .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A.



