From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Re: Inserting rules is extremly slow :((
Date: 12 Dec 2002 15:03:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039698200.11114.62.camel@bigblue>
References: <3df87716.1a99.0@unacs.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3df87716.1a99.0@unacs.bg>
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
To: nedco@unacs.bg
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2002-12-12 at 13:46, nedco@unacs.bg wrote:
> 
> 
> 
> Hi,
>  How to insert fast about 20000 rules in iptables.
>  If some document will be help , please let me know  :)
> 
> Thanks a lot
> Nedco
> 

I would write a firewall script and run it...
Put the script in /etc/rc.local and then if you ever reboot, viola

Paulo


