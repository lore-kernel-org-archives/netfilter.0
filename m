From: Andre Costa <brblueser@uol.com.br>
Subject: Re: IPTABLES and SSH -- READABILITY
Date: Thu, 16 Jan 2003 12:02:29 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030116120229.18f3a4b6.brblueser@uol.com.br>
References: <NEBBICCJKLGJHMMNBPIKGEDPEDAA.sbisgaard@xtrasource.com>
	<1042713729.485.14.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042713729.485.14.camel@rayw.knowledgefactory.co.za>
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
To: netfilter@lists.netfilter.org

Gentlemen,

please don't forget to remove unnecessary quoted text from your replies.
Original poster was ok to send 300+ lines of code (after all, this was
the reason for the post in the 1st place), but replies kept 90% of
quoted lines for no reason...

Best,

Andre

On 16 Jan 2003 12:42:10 +0200
Raymond Leach <raymondl@knowledgefactory.co.za> wrote:

> On Thu, 2003-01-16 at 12:13, Steffen Bisgaard wrote:
> > Hallo everybody,
> > 
> > This is the first time I use this feature so if I am doing anything
> > wrong please bear with me...
> > 
> > I have the following iptables running on a RH7.3 machine. Can
> > anybody tell me why I am unable to ssh to the machine when iptables
> > is running?
> > 
> > For the SSH part I have also tried:
> > 
> > 
> > iptables -I INPUT -i $EXTERNAL_INTERFACE -p tcp --dport 22 --sport
> > 1024:65535 -j ACCEPT
> > 
> You also need to allow the server to respond:
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp --sport 22 --dport
> 1024:65535 -j ACCEPT
> 
> Have you checked your firewall log file for other clues?
[snip]

-- 
Andre Oliveira da Costa

