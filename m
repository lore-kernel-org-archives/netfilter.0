From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: using iptables to filter nimda. code red virus
Date: Fri, 13 Sep 2002 11:21:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209131021.g8DALgv11227@vulcan.rissington.net>
References: <Pine.LNX.4.33.0209091917581.31845-100000@panda.center-f1.ru> <3D7EFBCF.70406@fugmann.dhs.org> <009301c259ee$12079310$6500a8c0@systemsadmin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009301c259ee$12079310$6500a8c0@systemsadmin>
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

On Thursday 12 September 2002 12:50 am, Joe de Vera Jr. wrote:

> hello fellas,
>
> can i make use of the iptables scripting to disable the access pages... for
> example for code red it access /default.ida page while in nimda /root.exe
> and cmd.exe
>
> is there a way to dis allow this..

You are asking for a content filter, and iptables is a packet filter.   
Different things.

Try:
1. Blocking access in your httpd.conf file of your web server
2. Using a transparent proxy such as Apache to filter out things you don't 
want.
3. Hogwash.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

