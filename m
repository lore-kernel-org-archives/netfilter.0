From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 16:31:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC51BC8.1000403@Loudoun-Fairfax.com>
References: <1069853846.3fc4ac966be15@paris-hme1> <20031126151015.GB4486@cannon.eng.us.uu.net> <200311261417.22501.Antony@Soft-Solutions.co.uk> <1069880102.3fc513260c677@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069880102.3fc513260c677@paris-hme1>
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
To: netfilter@lists.netfilter.org

zynkx wrote:

>hi again Antony:
>
>you just said it all. no use for me to add not even 
>one line to what you just wrotte :))
>
>now if anyone has got those masks i would appreciate 
>it :))
>
>tanx again and sorry for this mess ;)))
>  
>

zynkx:

If your mail server is running qmail, then your best bet is to read the 
qmail documentation and learn how to apply filters for the mail server. 
If you do use iptables, you will need to create a FORWARD rule to allow 
mail from each of the smtp servers that Ramin listed. Since any message 
from a Yahoo or Hotmail account will be sent from one of those servers 
you don't *have* to know every ip range that they've been assigned. The 
only problem doing it this way is if they change smtp server IPs you'll 
need to change your rules. I would do this with qmail if I were you.

Antony:

It sounds like you have the "We're behind schedule and you got to get 
this done before the holidays blues!"

Jeff



