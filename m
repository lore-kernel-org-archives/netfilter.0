From: Outvi V <i@outv.im>
Subject: iptables by cgroup path no longer works after starting Docker or KVM
Date: Sun, 26 Jul 2020 18:12:28 +0000 (UTC)
Message-ID: <348370ff-e01c-3366-ed99-d613c2bba0f7@outv.im>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outv.im;
        h=from:subject:mime-version:to:content-type:content-transfer-encoding;
        s=s1; bh=kje+caR4ToeszM1Yi8SIjHSxiOVM0wWsBDd2wdwrVKc=;
        b=vvQhTU84FK6AKLcYzSWnuU7fMDy5ygfJfhRMeHFR3xM66Pf/bEf9TjAdZ+lMYikyEkJV
        pDzGGF7OzkNMuVYLBsZm1AsQUYu3QT0zFPur5QLJvea4Fn7GHlyNKyFbVU7CPkXggwUoIu
        ioWuy6DCq8RIZ1Nkrv/I+l0qLvmc6t2Aw=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,

I'm using iptables to build a transparent proxy on my computer,
forwarding traffic to a proxy program. During the process, I need to
bypass some traffic (such as local traffic and traffic from the proxy
program) using cgroup path filter. The rules are like this:

# Redirect all output traffic to the chain
iptables -t nat -A OUTPUT -p tcp -j TCPROXIED
# For traffic from processes in the "bypass.slice", go outbound directly
iptables -t nat -A TCPROXIED -m cgroup --path "/bypass.slice" -j RETURN
# Other traffic are redirected to the proxy program port
iptables -t nat -A TCPROXIED -p tcp -j REDIRECT --to-ports 7892

It works well after I joined the proxy program to bypass.slice via systemd.

However, if I start Docker or KVM, the cgroup path filter is not in
effect anymore, creating a package circuit on my device, and thus
breaking the entire Internet access (said "too many sockets" by the
proxy program). Stopping Docker or KVM doesn't fix the problem,
resetting the iptables doesn't fix, either, but rebooting fixes the problem.

Could you give me suggestions on finding the cause of this problem?
Please feel free to reply if you need further information or tests.

The kernel version of mine is 5.4.53 LTS.

---
Outvi V
