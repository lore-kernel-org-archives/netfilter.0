From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 13:00:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111200.g8BC0Yv08428@vulcan.rissington.net>
References: <Pine.LNX.4.33.0209091917581.31845-100000@panda.center-f1.ru> <3D7EFBCF.70406@fugmann.dhs.org> <00a601c259ee$57f815c0$6500a8c0@systemsadmin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a601c259ee$57f815c0$6500a8c0@systemsadmin>
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

On Thursday 12 September 2002 12:52 am, Joe de Vera Jr. wrote:

> hello fellas,
>
> can i make use of the iptables scripting to disable the access pages... for
> example for code red it access /default.ida page while in nimda /root.exe
> and cmd.exe
>
> is there a way to dis allow this..

You'd be better off doing this in your apache httpd.conf (or whatever server 
you happen to be using).

Netfilter is not really a content filter.

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

