From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to build a routing/packet filtering experimental environment on single PC
Date: Tue, 29 Jun 2004 16:58:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291658.30241.Antony@Soft-Solutions.co.uk>
References: <BAY8-F96k6GW1lnU0290007fff2@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F96k6GW1lnU0290007fff2@hotmail.com>
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

On Tuesday 29 June 2004 4:43 pm, Li Xinyi wrote:

> Hi, there
>
> I started to learn iptables a few weeks ago. I am stuck at moment because I
> dont have many machines to play with. I am wondering is there any tools,
> which can be used to build a virtual envionment to play with routing and
> packet filtering on sinple machine. Tools like VMware would not be my
> choice because I only have 1GHz PIII with 256M memory.

It's very hard to route any packets when you only have one machine (real or 
virtual).

I really think a minimum of two machines is necessary to do much experimenting 
with netfilter - one machine as a client you can control, one as the router / 
firewall you want to test things on, and then a connection to the Internet 
where you can find all the servers...

VMware would indeed be an effective way to do this, however 256Mb RAM isn't 
going to go very far :)

Regards,

Antony.

-- 
"Linux is going to be part of the future. It's going to be like Unix was."

 - Peter Moore, Asia-Pacific general manager, Microsoft

                                                     Please reply to the list;
                                                           please don't CC me.


