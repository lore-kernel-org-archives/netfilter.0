From: Jim Carter <jimc@math.ucla.edu>
Subject: RE: work ip address at home
Date: Wed, 22 Oct 2003 19:35:51 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310221918430.4648@xena.cft.ca.us>
References: <7C9884991ADAE0479C14F10C858BCDF5122E78@alderaan.smgtec.com>
 <20031022125857.K34090@chemsun.chem.umn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031022125857.K34090@chemsun.chem.umn.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brent Gregersen <gregerse@chemsun.chem.umn.edu>
Cc: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

On Wed, 22 Oct 2003, Brent Gregersen wrote:
> The license server is a machine I do not have access to. It is running
> Elan License Manager software for Tecplot (application I want to use at
> home to prepare graphs/plots for journal articles). I believe tecplot
> compares the ip address of application machine to a 'valid' ip domain
> contained in license obtained from the license server.  This was the reasoning
> behind the 'trick application into thinking I am at work' approch. I
> could be wrong on this however. If thats the case, I'll look into
> implementing a VPN solution between my home machine and work machine.
> (wrong forum, but any pointers/urls on useful VPN software?)

If it's anything like flexlm, there's a license file on the local machine
which tells it the host name and port number of the server.  Flexlm
actually doesn't care which of our various subnets the client is on, only
how many licenses it's passed out, though our firewall rules DO care :-)
In any case, it would be worth the effort to try to fake it out using ssh.
Here's a sample command line for forwarding SMTP (port 25) that I (used to)
use for sending mail as if local, to bypass our anti-relaying rules (look
at the headers of this message, for the current solution :-)

/usr/bin/ssh -q -x -f -N -L 20025:julia.math.ucla.edu:25 julia.math.ucla.edu

(-q - quiet, -x = omit X-windows, -f = drop into background, -N = omit
shell command, -L = port forwarding.)  I test by doing...

telnet localhost 20025

To my HELO, it responds:

250 julia.math.ucla.edu Hello julia.math.ucla.edu [128.97.4.254], pleased
to meet you

The packets appear to come from Julia, the host listed in the -L parameter.
It might be a good idea to turn on keepalives, so a forgotten connection
automatically exits when the net connection goes down.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

