From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: pleas help me
Date: Wed, 4 Feb 2004 09:33:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040204083343.4F39A1B9BA@smtp.ttp.nl>
References: <000a01c3ea9e$06d4fd60$3a64a8c0@skrobi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c3ea9e$06d4fd60$3a64a8c0@skrobi>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

> I have a problem witch using ftp protocol ; my router using
> mandrake linux 9.2 , i define rulez correct in tables the
> network adress translation too . When i want to connect to

How do we know if you used the correct rules if we don't know what the
rules are ?

> ftp server (ftp.lublin.pl or ftp.redhat.com and any others)
> from local network , the server respond i login in to server
> but when i want to use "ls" command or try to download file
> from server he sends me : "Will not open connection to [my
> local ip] <only to [router external ip]>". I dont know what
> to do please help me (this is not a ftp client problem from
> router its all works with no problems)

Did you load the ftp modules ?

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp


Gr,
Rob


