From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: sendmail : dport 25 , sport 25 or both?
Date: Thu, 22 Jan 2004 05:42:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074768174.2002.18.camel@tarkus>
References: <200401220850.27734.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200401220850.27734.mrakotom@free.fr>
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
To: Rakotomandimby Mihamina <mrakotom@free.fr>
Cc: netfilter@lists.netfilter.org

If the daemon listens on port 25, then the connection will be destined
to it on port 25. 

So 
Input chain allows destination port 25
Output chain allows source port 25

Do you have a specific need for blocking all output packets?


Ted


On Thu, 2004-01-22 at 02:50, Rakotomandimby Mihamina wrote:
> HEllo ,
> I'm running sendamil on my box .
> I'm dropping all outgoing packets ( policy ) .
> I want the sendmail packets not to be dropped , have i got to allow outgoing 
> "--sport 25" packets , "--dport 25" or just "--ports 25" 
> 
> thanks in advance for your help .


