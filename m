From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging of kernel packets dropped for lack of a route
Date: Tue, 6 Apr 2004 00:28:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404060028.49546.Antony@Soft-Solutions.co.uk>
References: <4071A85F.E2D9D7ED@vrml.k12.la.us>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4071A85F.E2D9D7ED@vrml.k12.la.us>
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

On Monday 05 April 2004 7:41 pm, root wrote:

> How may one log packets the kernel drops because  no route exists ???

Perhaps by adding a default route and then dropping the packets with 
netfilter, after logging them?

It's certainly the only way I can think to answer this question using 
netfilter.

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


