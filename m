From: Dmitriy Zakalyuzhniy <dimz@tendel.dp.ua>
Subject: Re: about device polling and kernel configurations
Date: Fri, 23 Sep 2005 11:58:49 +0300
Message-ID: <20050923115849.22387c34.dimz@tendel.dp.ua>
References: <013701c5c01a$abdf54b0$060ae29f@javaboy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <013701c5c01a$abdf54b0$060ae29f@javaboy>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 23 Sep 2005 16:42:03 +0800
"jywang" <jywang@cnic.cn> wrote:

> How to check the values of kernel configurations.
> when we compile a kernel, we must set the values.
> and now, when the system is running, i want to know
> them again.
> 
> how? maybe a command is ok or a file can be read.

In /boot directory you will find file calling config-<version-of-your-kernel>. This file keep all options of your kernel.

