From: "Eric Leblond" <eleblond@init-sys.com>
Subject: Re: understanding ip_conntrack entry
Date: Fri, 4 Oct 2002 10:31:44 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33337.194.98.166.58.1033720304.squirrel@postmail.alphalink.fr>
References: <000f01c26b18$2d114990$3201a8c0@leonardo>
        <3D9D00B0.8080901@iprimus.com.au>
Reply-To: eleblond@init-sys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D9D00B0.8080901@iprimus.com.au>
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
To: netfilter@lists.samba.org

>>my remote machines. My question is .... if this connection is marked as
>>ESTABLISHED, shouldnt it appear on 'netstat -an' entries ??? I think it
>>should, but it's not appearing there .....

No, netstat give you information about sockets created on your box
and not about your box acting as a routeur. That's why you don't see things
appearing in ip_conntrack if your machine is not or source or destination
of the packet.
--
Eric Leblond
e-mail: eleblond@init-sys.com





