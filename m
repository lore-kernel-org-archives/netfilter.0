From: "James A. Pattie" <james@pcxperience.com>
Subject: Re: Start Up Script
Date: Thu, 06 Mar 2003 09:55:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E676F72.1060702@pcxperience.com>
References: <NHBBICNKELBGKGHPCFMPOEMFCAAA.bbunnell@iastate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NHBBICNKELBGKGHPCFMPOEMFCAAA.bbunnell@iastate.edu>
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
To: Brian Bunnell <bbunnell@iastate.edu>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Brian Bunnell wrote:
> Hello
>
> Thank you very much for helping me.  I have a perfectly good netfilter
> script that I run from the command line and everything works fine.  I
would
> like this script to run when I boot up the computer.  I am having a lot of
> trouble finding quality resources on the net about this.
>
> There are great resources for learning how to use netfilter.  However,
when
> it comes to startup scripts, all the examples seem to be 25 pages long and
> incomprehensible or wnat me to completely rewrite the script I already
have.
>
> Why can't I just tell the computer to run my script instead of the
"Let the
> world in" script it runs at boot?
>
> Does anyone have any recommendations, resources or better yet, a good
> concise example for run level 3?

If you are on a chkconfig/sysv system just add the necessary chkconfig
entries to the top of your script, drop it in /etc/init.d and chkconfig
{script name} on.  Make sure you disable the iptables scripts if on a
redhat box.

The PCX Firewall project will generate a redhat init script.
http://pcxfirewall.sf.net/  Use that for examples on how to modify your
script.


- --
James A. Pattie
james@pcxperience.com

Linux  --  SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/

GPG Key Available at http://www.pcxperience.com/gpgkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE+Z29xtUXjwPIRLVERAph1AKCm9hDscA7l/fgnoVf2vg5TvzGVngCfRdGJ
tWrFpueX8wJ4AVpZ7Jw+MC0=
=mimX
-----END PGP SIGNATURE-----


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


