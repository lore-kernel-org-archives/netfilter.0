From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Why would these rules cause errors only sometimes?
Date: Mon, 28 Oct 2002 16:53:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281653.g9SGrSe08992@vulcan.rissington.net>
References: <20021024074429.90347.qmail@web40708.mail.yahoo.com> <20021024220039.GA1068@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021024220039.GA1068@Ajftl1.ajfthome.on.ca>
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

On Thursday 24 October 2002 11:00 pm, Alistair Tonner wrote:

> On 2002.10.24 03:44 Tasha Smith wrote:
> > ---OK...but the only problem is i have a DYNAMIC ip adress. Soo it
> > changes and
> > soo if i put an Ip adress i have right now in my script where eth0 is
> > it will
> > change and then it will block me from the net? How can i get it to
> > update my ip
> > adress in script when it changes!

> This line will grab your current IP off the ppp0 link --
>
>   INET_IP=`ifconfig ppp0|grep P-t-P|awk -F : '{ print $2 }'|cut -d \
> -f 1`;
>
> this line will grab your current IP off any ethx link
>
>    INET_IP=`ifconfig eth[x]|grep "inet addr"|awk -F : '{ print $2
> }'|cut -d \  -f 1`;
>
> change the above to suit your needs ...

If you are using dhcpcd to get your dynamic address, you can put whatever 
commands you like into /etc/dhcpc/dhcpcd-<interface>.exe which will be 
executed whenever dhcpcd detects a change in the interface address.

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

