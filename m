From: Nandan Bhat <nlbhat@gmail.com>
Subject: Re: Problem with connection tracking in IPtables!!
Date: Thu, 10 May 2007 13:42:10 +0530
Message-ID: <4642D3DA.7060801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=cO/rD0ov841ymTSKXllbAF5uGQO19rCMCQ6vxXxvr6q3v93f4B2sOxRVM+kbSXR/iBn8JNT3lU7Rm703Ni2zaSVFWjl8StNPlzAkpZ+MqOC4LFUa5+OWCtpt2JYs03rDd6F6KUBlMb/8yunSRoOLjVANakFlAf+TLI1YCb170OI=
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
To: netfilter@lists.netfilter.org

Dear Visham,

I faced a problem with iptables after upgrading to a recent kernel. 
However, the original Fedora install booted just fine.

I went through some online forums and found somebody suggesting that I
1. comment all my iptables rules (/etc/sysconfig/iptables);
2. uncomment/enable one rule
3. restart iptables
4. look for a failure message

One subsequent rule showed that I had a "-m state" specified, but no 
kernel module compiled for it. I just ran the "make menuconfig" again; 
went through all the options under Networking -> Netfilter configuration 
and enabled all modules (just to be safe). Enable specific modules to 
your requirement.

I am not sure if this solves your problem; it solved mine.

Nandan

