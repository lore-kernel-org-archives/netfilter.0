From: <netfilter@drbroyles.com>
Subject: Re: Time changes
Date: Wed, 22 Oct 2003 16:13:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c398d8$e5b13660$73593a42@drbroyles.com>
References: <NEBBICCJKLGJHMMNBPIKAENKFLAA.sbisgaard@xtrasource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: sbisgaard@xtrasource.com
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>

Yes, you would need to utilize the time patch.  Go to the following Howto to
read up about it.
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-3.h
tml#ss3.19

Brandon Broyles
  ----- Original Message -----
  From: Steffen Bisgaard - Xtrasource
  To: netfilter@lists.netfilter.org
  Sent: Wednesday, October 22, 2003 3:44 PM
  Subject: Time changes


  Hallo list,

  A quick question: Is it possible to block access to and from a PC (say
10.2.0.3) at a specific time, for example 21:00, and re-enable it at 08:00
the next day using iptables - and if so how?? Yes this is the kids PC...
  It used to be real simple with ipfw - I can't remember the syntax but
something along the lines of ipfw -add (or -remove) deny (or allow) 10.2.0.3
all

  Any ideas? Or do I need two separate iptables scripts?


