From: Alex Feldman <alex@alexandrite.boisestate.edu>
Subject: Re: can't tunnel through iptables
Date: Mon, 27 Nov 2006 15:23:24 -0700
Message-ID: <200611272223.kARMNO2D002086@alexandrite.boisestate.edu>
References: <200611222003.kAMK3G6A024294@alexandrite.boisestate.edu>
	<48FB74E4-C862-4D04-9185-F171EACDC1FF@mimectl>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <48FB74E4-C862-4D04-9185-F171EACDC1FF@mimectl> (message from
	Sietse van Zanen on Fri, 24 Nov 2006 11:54:07 +0100)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thank you for the response, but that didn't work either - same thing, it
just hangs until the connection times out.

I'm sorry it took so long for me to get back to this, but I have
appended my original query in its entirety since it's been a while  Any
help at all is appreciated.

>>>>> "S" == Sietse van Zanen <sietse@wizdom.nu> writes:

S> --_8B2D74D2-40BE-41C2-9D7E-55F3440F2DBA_ Content-Type: text/plain;
S> charset="iso-8859-1" Content-Transfer-Encoding: quoted-printable

S> I think you should use: ssh -L 143:localhost:143

S> The result of using the servername might force you to add an iptables
S> rule = to except connections from your server IP.

S> -Sietse


 From: Alex Feldman Sent: Wed 22-Nov-06 21:03 To:
 netfilter@lists.netfilter.org Subject: can't tunnel through iptables


 This is probably really an ssh question, but I'll try it here anyway.
 I am running tptables v. 1.3.5 on FC5.

 I am running iptables on my server.  It locks down most everything
 for INPUT, only opening up a few ports for mail and http.

 I have a second script I can run besides my usual one.  The only
 difference between the two ar the following two lines in the second
 script:

 iptables -A INPUT -p tcp -i eth0 --dport 143 -m state --state NEW -j
 ACCEPT iptables -A INPUT -p udp -i eth0 --dport 143 -m state --state
 NEW -j ACCEPT

 With those two lines in place, I can use an IMAP mail client
 (thunderbird) from my laptop to connect with my server and everything
 works great.  Without them, thunderbird just hangs.

 I would like to run the IMAP protocol through an ssh tunnel.  So
 leaving the orignal script in place, I su'd to root on my laptop and
 entered the following command:

 ssh -L 143:myserver:143 myserver

 and it let me login to the server after performing the RSA
 authentication, but I cannot connect my local thunderbird client to
 the server - it hangs just as would if had not tried to establish the
 tunnel.

 I have tried several variations on this, including telling the
 thunderbird on my laptop to use a non-well-known port, e.g., 8118,
 and then not suing to root on the laptop but just as myself entering
 the command

 ssh -L 8118:myserver:143 myserver

 to try to set up the tunnel without being root, but nothing seems to
 work - thunderbird always tries and retries and eventually gives up
 trying to establish a connection.

  Thanks for any ideas.

-- 
	--alex			alex@math.boisestate.edu

        <a href="http://math.boisestate.edu/~alex/">Alex Feldman</a>

