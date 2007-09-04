From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: problem on iptables
Date: Tue, 04 Sep 2007 13:11:27 -0600
Message-ID: <web-23979449@bk3.webmaillogin.com>
References: <e3c78d830709041148w526b78d5nb9b0dffe3a8a81a0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e3c78d830709041148w526b78d5nb9b0dffe3a8a81a0@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peng Yang <pey204@gmail.com>, netfilter@lists.netfilter.org

You don't need any patch to put to work netfilter/iptables.

I'm pretty sure that is disabled in the kernel configuration.

Jorge.

On Tue, 4 Sep 2007 14:48:30 -0400
  "Peng Yang" <pey204@gmail.com> wrote:
> Hi,
> In our current kernel, iptables doesn't work due to the error "can't
> initialize iptables table `filter'".
> I suspect that the netfilter is not turned on in the kernel.
> We download the v2.6.20.11 sourcecode and try to do a menuconfig but
> the networking packet filtering framework does not provide any option
> for us to select to turn on netfilter. Can anyone let me know what patch 
>files
> I need to add to allow me to choose this netfilter feature?
> 
> thanks
> peng
> 
> 

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

