From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: to know smtp traffic
Date: Tue, 23 Sep 2003 09:12:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309230912.57680.Alistair@nerdnet.ca>
References: <016401c381cd$3f713b50$0304a8c0@joanker>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <016401c381cd$3f713b50$0304a8c0@joanker>
Content-Disposition: inline
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
To: "Joan Soler (CODINE)" <joan@codine.es>, netfilter@lists.netfilter.org

On September 23, 2003 08:21 am, Joan Soler \(CODINE\) wrote:
> Hello, I'm trying to know the size of my traffic in smtp port (25), I
> write:
>
> iptables -A INPUT -p tcp --dport 25 -j traf_in
>
> But it doesn't works, anyone knows what can I do. I use Suse 8.0.
>
> Thanks a lot!!!.
> Joan S.

	And what do you have in traf_in chain?
	
	You could put a single line in traf_in that would log each packet, but that 
would not accomplish your goal.

       You (if your firewall is DROP all and accept what you want/need) have a 
line that accepts packets on port 25 somewhere.
	
	iptables -L -v includes packet/byte counters.

	The line that accepts your port 25 traffic will show inbound data counts.
	You could then setup a line that monitors outbound -dport 25 to see what
	your oubound data packet counts are.

 	there are other tools that are available to monitor this as well ... but 
they are not in my scope.

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

