From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 19:02:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181902.36185.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC65C@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC65C@csrees-exchsrvb.csrees.usda.gov>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 18 February 2004 6:47 pm, Martinez, Michael wrote:

> I put the logging in, and it's logging stuff ... But logging absolutely
> nothing when I "telnet 80" or "telnet 8080" to this box.

In that case, the packets addressed to port 80 or port 8080 are not getting 
rejected by the last rule in your user-defined chain.

Either they are not even reaching your machine at all (you don't have some 
sort of transparent proxying on your network, by any chance, do you?), or 
else they are reaching the application (web server) and being accepted or 
rejected there.

> ???!!

I am afraid to say that I agree with this observation :(

Regards,

Antony

-- 
I'm pink, therefore I'm Spam.
                                                     Please reply to the list;
                                                           please don't CC me.



