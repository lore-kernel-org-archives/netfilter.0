From: Moritz Gartenmeister <moritz.gartenmeister@access.unizh.ch>
Subject: Re: iptables crashes server?
Date: Tue, 05 Apr 2005 20:22:52 +0200
Message-ID: <4252D77C.1050309@access.unizh.ch>
References: <4250F7E0.3070203@uplink-verein.ch>
	<1403218a05040404475c810345@mail.gmail.com>
	<42523486.7000107@uplink-verein.ch>
	<Pine.LNX.4.60.0504051232040.11158@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0504051232040.11158@darkstar.sysinfo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

R. DuFresne wrote:
> 
> There are two things you might do to deal with memory over consumption 
> issues;
> 
> Add more RAM to the system
> 
> or off load some of the services to other systems rather then directly 
> running them all on the firewall server.  And this is likely the better 
> way to deal with the problem in my mind.  firewalls afterall are 
> traditionally a single purpose system.

more ram does not solve the problem, only delay it.
i don't run much services on the server. and i stopped them to look at the memory usage.

my newest idea: network card driver tg3.

cheers
moritz

