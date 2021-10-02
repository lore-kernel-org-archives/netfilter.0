From: Kerin Millar <kfm@plushkava.net>
Subject: Re: netfilter 10,000' overview
Date: Sun, 3 Oct 2021 00:49:37 +0100
Message-ID: <20211003004937.acbbc610fc32536fcdd9f736@plushkava.net>
References: <010901d7b70a$86c8edf0$945ac9d0$@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        BcTfBMBKH69ya1t30oSQCK2ACk2i9/fhbFb1E4Ynlt4=; b=Fo7NHEZ5Sha8QYaI
        Xsmf1UVfdStWdqcrPDvgPuoXFK+xOIhJiqWx6CJAhFjl8qT3a5AZpDsoPWb5nm9h
        TVyk1eRoBM7cVXqU+rzbW7xlsiTORM0qIJFllYo5PwHqeMEwFz4G9fAgwsLo3jeb
        ufFThMofp8Y0Fvqov5exXuROAoHxbtoWI19xseyv90x91tsRRbvQ3FkD0YZGSotP
        LOKRlPcL9WQgV80+XqDA+6CyTqItZ7IY69KHuFLOxm2wHLQy75U40xj6v2dLMkm6
        fctGWD2OgRxSCRu+NFuMwIzLojTLlwJA8x+KOg5bJ3C8vavWLqAh9fBsBUWSyNp/
        r5MqpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=BcTfBMBKH69ya1t30oSQCK2ACk2i9/fhbFb1E4Ynl
        t4=; b=gZLysePZfvNxOkURUmpRrkB2hc4iuSuqRrcOnmTmo8DiZXFWhC+om8zAE
        D7Z+Hi7X0lq7wJi+x/dDnau5+3SE5Ruhz0u0/B/Uxtcn3/1MibR3LoavtDz3Ba5g
        30MycPMKuJpJPtmLVdPbBosQ/Z+uhhC4/E1WGpwCn9BTX2DPpIdZWrG1D1k0n2iU
        hM3IEkGpU1uVslCYwgaEroDYkA0qfp2V0p50QMXEFFQ2TZjLOsMQBbwrP6ad0HgS
        q/nC7GxvmXKVH0KYNGMPAT+Tt4UYKedhRj8ayKGnu4RCQTSnmCLUi42v1UQJt8f/
        3OXqmO3vAaF0qsaGD2hu82RFzVkwg==
In-Reply-To: <010901d7b70a$86c8edf0$945ac9d0$@gmx.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff <jnewman67@gmx.com>
Cc: netfilter@vger.kernel.org

On Fri, 1 Oct 2021 17:23:05 -0400
"Jeff" <jnewman67@gmx.com> wrote:

> I've had  a notion of how iptables worked on RHEL4 and CentOS 6 machines,
> and am now using CentOS 8, and I think I need a little
> re-education/realignment.  Could someone please verify I have this
> understood generally correctly, or point out my missteps - I'd really
> appreciate it.
> 
> On my previous 2 servers, I had been using iptables to create rules for
> packet filtering - simple DROP rules targeted at IP addresses shown to be
> attempting abusive behavior.  I just blocked them fully - zero traffic,
> regardless of port was abused - done.  Starting and stopping the iptables
> service would toggle this filtering on and off - very simple and it worked
> as understood.  I also assumed it somehow was directly connected to the
> kernel-level network traffic stream.  I assumed that iptables was the both
> the function for making rules as well as the implementor of those rules,
> based on the command line for making the rules and the same name used in
> starting/stopping the function.  Easy peasy.  I have no idea if or where
> netfilter fits into these two older servers, if at all.  Is it kernel-level
> in these older OS versions?  Is it a secondary service that iptables just
> sits on top of?  Is it really just iptables?
> 
> On my CentOS 8 machine, I think I've figured out that netfilter is the
> kernel-level access to the network traffic stream that implements the rules,
> and that iptables (now nftables) is the rule-maker that manages some global
> set of netfilter-compatible rules.  And I think that netfilter is always
> "running", and that the management of the rules, and the access those rules,
> can be done using many different utilities, like nftables, firewalld,
> bastille, ufw, etc.  And that when "starting" and "stopping" one of those
> utilities, for example nftables, you're not really starting or stopping
> those particular utilities or netfilter, you're really just controlling
> access to that global ruleset as it's currently defined, essentially turning
> netfilter on/off without really stopping that kenerl-level service.
> 
> Does that sound correct?
> 
> If that's all true, can any/all of the above utilities (nftables, firewalld,
> ufw, bastille) all be installed and usable on the server at the same time
> (not that I want to, but wondering if they somehow would conflict)?  Does
> making one rule in one utility interfere with making some other rule using
> another utility?  Does starting one "service" (nftables for example) somehow
> adversely affect netfilter if there are rules made by firewalld or bastille?
> 
> I hope the questions are well phrased and close enough to the truth make
> answering worth your time.
> 
> Thank you.
> 
> Jeff
> 
> 

You're definitely on the right track. Let's consider the manner in which Netfilter is introduced at the netfilter.org website.

"The netfilter hooks are a framework inside the Linux kernel that allows kernel modules to register callback functions at different locations of the Linux network stack. The registered callback function is then called back for every packet that traverses the respective hook within the Linux network stack."

So, Netfilter lays down the infrastructure that makes it possible to hook into the network stack. Other kernel components are able to establish these hooks, effectively registering an interest in packets at a given juncture. Effectively, these other components are able to say "I have an interest in whatever passes at this point in the network stack; please consult me each time that happens". The consultation, as it were, happens by way of registering "callback" functions, which Netfilter is then duty bound to execute. Overall, Netfilter 'runs' for as long as the applicable kernel modules remain loaded into memory. All of which is ideal for implementing a flexible and extensible packet filtering system. Where it gets interesting - and potentially confusing - is in the matter of what these o
 ther components are.

The kernel implements two notable frameworks that build on top of Netfilter, which are xtables and nf_tables. You are probably used to working with xtables. In that case, it will have provided all of the features that are visible to you - chains, rules, matches, targets, extensions and so forth. Think of iptables as being the frontend and xtables as being the backend. You run iptables (in userspace) so as to interact with this backend (in kernel space) and give it its marching orders. Your distribution may provide an "iptables" service or the like which, upon starting, is typically doing little more than to invoke the iptables-restore utility. In turn, xtables is responsible for taking the ruleset and rendering it operational. Upon stopping the service, the kernel modules usually remain lo
 aded. However, instructions are effectively issued to flush the ruleset, or to load a ruleset that is bereft of any user-defined chains and which allows for everything to pass.

As compared to xtables, nf_tables is distinct and its implementation is somewhat different. While the nf_tables backend is - and always was - intended to be used with the nft frontend, there now exists a compatibility layer which makes it possible to use iptables with nf_tables as a backend. In that case, iptables rules are translated directly into 'pure' nftables rules at the point that they are defined, where possible. Otherwise, they are defined as hybrid rules, whereby they are able to make use of existing xtables features. You can read more about that at https://www.redhat.com/en/blog/using-iptables-nft-hybrid-linux-firewall. In the case that your system has iptables >=1.8.0, you should find that it's possible to invoke either of "iptables-legacy" or "iptables-nft", with "iptables" it
 self being symlinked to whichever is considered to be the preferred implementation. Some distributions provide a mechanism by which to switch from one to the other as the default.

Both the xtables and nf_tables backends can be operational at the same time, with each having registered Netfilter hooks. This can happen accidentally; say, as a result of having loaded a ruleset with iptables-legacy then having inadvertently switched to iptables-nft. Or perhaps by starting to use nft while forgetting that an xtables-backed ruleset already exists and is loaded. Needless to say, this situation should be avoided because it then becomes very difficult to reason with the behaviour of Netfilter at large. Either use iptables-legacy exclusively or, if switching to iptables-nft or nft, ensure that the legacy ruleset is cleared out. Similarly don't try to manage rulesets with both nft and iptables-nft at the same time, unless you know exactly what you are doing. The intent of iptab
 les-nft is that its use of nf_tables as a backend be transparent to the user.

> 
> If that's all true, can any/all of the above utilities (nftables, firewalld,
> ufw, bastille) all be installed and usable on the server at the same time
> (not that I want to, but wondering if they somehow would conflict)?  Does
> making one rule in one utility interfere with making some other rule using
> another utility?  Does starting one "service" (nftables for example) somehow
> adversely affect netfilter if there are rules made by firewalld or bastille?

Applications such as firewalld, ufw, ferm and firehol are sometimes referred to as wrappers. Some of them execute nft or iptables directly, while others make use of libraries to communicate with xtables/nf_tables in a more direct fashion. They all generate rulesets that could have been produced by hand. Each has its own unique perspective as to how a ruleset should be composed and managed and, generally speaking, they expect to be the sole arbiter as to the contents of the ruleset. It stands to reason that wrappers cannot be expected to co-exist and that you should generally not try to manage the ruleset of your own accord (other than by the interfaces provided by your choice of wrapper, of course). In the case that you do want to manage your rulesets directly, at least make sure that thes
 e wrapper services have been stopped and are not set to automatically start upon the next boot.

-- 
Kerin Millar
