From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Selective Masquerading
Date: Sun, 25 Apr 2004 22:53:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404252253.13553.Antony@Soft-Solutions.co.uk>
References: <BAY8-F97Fk2H3b98Ktd0002fb6f@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F97Fk2H3b98Ktd0002fb6f@hotmail.com>
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

On Saturday 24 April 2004 5:14 pm, Edgar Estrada Lopez wrote:

> HI guys:
>
> I have a DSL @ 1mb, and another one @ 256kbps
> So I could have fast downloads, and fast web browsing also.

Have you thought of using QoS to prioritise HTTP traffic, so you get a fast 
response on web browsing, whilst allowing downloads to use all the bandwidth 
when there isn't an HTTP request happening?   That way you might achieve what 
you want with just the 1Mbps DSL line.

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - Report in the New York Times, following a demonstration at the 1939 World's 
Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


