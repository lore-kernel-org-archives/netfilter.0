From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port 389
Date: Fri, 23 Jan 2004 08:38:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401230838.05694.Antony@Soft-Solutions.co.uk>
References: <200401230827.13331.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401230827.13331.mrakotom@free.fr>
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

On Friday 23 January 2004 7:27 am, Rakotomandimby Mihamina wrote:

> Hello ,
> I asked for some frineds of mine to scan mly host , and they all find my
> 389 port opened . here is the report , for those who understand french :
> http://www.tsenagasy.com/forum/viewtopic.php?p=33992#33992
>
> i dont understand what's happening :
>
> netstat | grep 389
> gives nothing , and
> this is my set of rules .
> would you help me to see , what is wrong ? or is the 389 just an "answer"
> port ?

TCP port 389 is used for LDAP.

(There is no such thing as an "answer" port.   Services answer from whatever 
port they listen on.)

I suspect your ISP has some sort of transparent authentication proxy server 
set up and that it is this which your friends are finding.

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


