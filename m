From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: i need a little help with ftp please...
Date: Wed, 5 Feb 2003 23:41:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302052341.57529.netfilter@newkirk.us>
References: <20030205232733.8532.43059.Mailman@kashyyyk> <004501c2cd8a$90751b90$483918ac@C1006818>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004501c2cd8a$90751b90$483918ac@C1006818>
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
To: mpboden <mpboden@surfcity.net>, netfilter@lists.netfilter.org

(extremely heavily snipped... :^)
On Wednesday 05 February 2003 09:50 pm, mpboden wrote:

> Basically, my problem centers around connecting to my ftp server from
> the internet. To start, I've installed wu-ftpd and have the ftp server
> operating properly when connecting to it via my internal network. I
> can have guest users log in successfully and upload/download properly.
> However, with the current iptables ruleset in place, no one can
> connect to the server from the internet. The packets are being dropped
> immediately, and users are not even being promted to enter in their
> user name and password; they get a connection timed out error. As a

>$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT

> $IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 21 -m state --state
> NEW,ESTABLISHED -j ACCEPT

The (real) short answer.  The first rule above accepts any connection=20
from the LAN, including FTP.  The second one should be "--dport 21" to=20
accept FTP connections FROM the internet.  (You probably DON'T want to=20
accept NEW connections FROM port 21 anyway...)

The LONG answer is in a private email. :^)

j


