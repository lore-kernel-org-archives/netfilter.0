From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nat on multihomed server
Date: Sat, 24 Jan 2004 09:23:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401240923.21218.Antony@Soft-Solutions.co.uk>
References: <1164.203.131.168.150.1074915322.squirrel@www.localgovernance.net.ph>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1164.203.131.168.150.1074915322.squirrel@www.localgovernance.net.ph>
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

On Saturday 24 January 2004 3:35 am, Sandy T. Santos wrote:

> our campany has two internet links from different isp's. we then use both
> of these to host the company's webserver. what i want is that the
> webserver maybe accessible by coming from my isp1 link or my isp2 link. i
> know that i need to set up my dns to have two ip addresses that points to
> my linux box and then DNAT that connection towards my webserver. what i
> don't know is what's the iptables script gonna look like for the SNAT
> reply. how would i be able to determine that the request that came in to
> my webserver originated from my isp1 or isp2 link  so that the reply would
> be SNAT'ed to that interface?

I suggest you give your webserver two internal addresses on the same interface 
(eg 192.168.1.100 and 192.168.1.101, or whatever fits with your addressing 
scheme), and DNAT one public address to the first, and the other public 
address to the second.

Your web server applications should be able to listen on multiple addresses, 
and it will reply from the address which was contacted, therefore the 
automatic SNAT rules which netfilter will do for you behind the scenes will 
work.   No need for manual SNAT rules.

Regards,

Antony.

-- 
My New Year's resolution is not to make any resolutions I can't keep.

I'm wondering whether I've failed already.

                                                     Please reply to the list;
                                                           please don't CC me.


