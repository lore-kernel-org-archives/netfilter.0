From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Colocated server
Date: Sat, 26 Jun 2004 16:01:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406261601.21943.Antony@Soft-Solutions.co.uk>
References: <20040626142924.GA25724@sneezy.fw.oom-killer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040626142924.GA25724@sneezy.fw.oom-killer.org>
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

On Saturday 26 June 2004 3:29 pm, Kevin de Kok wrote:

> Hi all,
>
> I have a server colocated at a isp. Do need to install some kind of
> firewall? The isn't in a network but just connected to the internet.
> With the services on it what are needed.

1. Who has to rebuild the machine if it gets trashed by an attacker?
2. Who gets held responsible if it's used to launch an attack elsewhere?
3. Who cares about any data which is held on the machine?
4. What are the legal obligations (under how many jurisdictions?) regarding 
any personal data held on the machine?
5. What services does the machine provide and how confident are you that they 
have no vulnerabilities (note: I did not say published or patched 
vulnerabilities)?

Other things to think about related to the above, but specifically because the 
machine is colocated at an ISP:

1. Do you trust the other customers of the ISP, whose equipment is 
(presumably) next to yours in a rack?
2. Does the ISP take responsibility for protecting their own equipment, or 
will they come after you if someone sends out an attack from your server?
3. How does the ISP bill you for services - could a compromise on your machine 
which results in large amounts of data transfer, land you with a big bill?

Finally, you need to think about what possibilities you are worried about, and 
whether a firewall (packet filtering or otherwise) is a suitable solution.

At the very least I would choose to put some network monitoring / intrusion 
detection / host hardening / file integrity checking onto the machine, so 
that even if I couldn't prevent a problem, I'd know about it as soon as 
possible.

Just my 2c - others may advise differently.

At the end of the day, it's your server / data / money / legal liability (the 
relative significance of each of the above depending on what the server is 
used for and by whom); you need to assess the risk.

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


