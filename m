From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables Query
Date: Wed, 23 Oct 2002 19:46:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210231846.g9NIkwL03386@vulcan.rissington.net>
References: <FLEKIPPLAEDMJMOOBBDPCECJDEAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPCECJDEAA.stewart.thompson@shaw.ca>
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

On Wednesday 23 October 2002 7:26 pm, Stewart Thompson wrote:

> HI Harish:
>
> 	Perhaps I should have asked for more facts. I assumed,
> perhaps incorrectly, that you wanted to forward the DNS request
> across the Internet It is my understanding that your IP fell within
> the private Class B IP range of  172.16.0.0  -  172.31.255.255.
> It is also my understanding that routers on the Internet drop IP's
> that fall into established private IP ranges. If I am wrong on this
> point, someone please correct me.

You are correct in your assumption.   Routers have for a long time dropped 
packets with private destination addresses (if for no other reason than 
there's nowhere to send them), and it is very common nowadays for routers 
also to drop packets with private source addresses, so they don't even reach 
their (perfectly legally addressed) destination.

However, since Harish says he has a CheckPoint FW-1 between his Linux box and 
the Internet, doing NAT for him, it will allow originally 172.16.x.y 
addressed packets to get out and the replies to come back again.   Hence the 
desire to send DNS requests from a specific private IP address seems 
reasonable in this case.

I hope that my earlier response, suggesting the use of the POSTROUTING chain, 
is helpful in achieving this.

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

