From: "Paul Menage" <menage@google.com>
Subject: [RFC] Using iptables to control bind/connect/accept/sendto permissions
Date: Mon, 3 Mar 2008 22:04:43 -0800
Message-ID: <6599ad830803032204j3dc191ech8dfb64d9366f5ffe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1204610686; bh=sytYmyMyYkXeiqelci94TAPES0U=;
	h=DomainKey-Signature:Message-ID:Date:From:To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition; b=M4cS
	vhlnpwBSJ1MxM2JyGpBnRNZJiUnZlL+nEpfe0W+64GwRLWpCuBqTx7FVi1Lg7YgIYNW
	9p8Mx2v4yC++Q4Q==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

As part of the cgroups/containers work, we'd like to be able to
control what kinds of socket connections processes can get their hands
on, on a per-group basis.

So for example, we might want to say that processes in a particular
group can listen on port X, and can connect to any hosts in a
specified netmask in a given range of ports. It woul also be nice to
be able to get notifications of what sockets different groups had open
(without having to regularly trawl through large /proc/*/fd
directories for large numbers of processes.

Now it would be possible to come up with our own API and mechanism for
specifying, enforcing, and reporting all these details, but creating
new complex APIs is generally a bad idea. Effectively what we want to
do can be expressed as a subset of the API and functionality of
iptables - when a user tries to perform a control-path operation such
as connect() or accept(), we want to check their request against a
series of rules, and be able to permit, deny, report, etc, their
request. Many of these rules will involve matches against things like
protocols, addresses, ports, etc. A NF_ACCEPT verdict would represent
granting permission; a NF_DROP verdict would represent a permission
failure.

Exactly how to fit this into the iptables architecture, I'm not quite
sure. At first I thought about adding a new netfilter hook,
NF_CONTROL, but changing the number of hooks seemed to cause nasty
compatibility issues with userspace and it would be nice to avoid
that. Eventually I got a partial prototype working for controlling
connect(), using the local output hook, but having the netfilter
callback for my new table do nothing. The sequence looked something
like:

- user attempts to do an operation on a socket
- protocol-specfic code (e.g. in tcp_v4_connect()) called a new
function ipt_control_check()
- ipt_control_check synthesized a fake skb with the appropriate
source/dest/etc fields and passes it to ipt_do_table()
- verdict is used to permit or deny the user's operation.

The same thing could be done for different protocols, and for accept(), etc.

Hooking into the local output hook doesn't feel quite right though - I
think it would make more sense to tweak ipt_do_table() so that it
could be used out of the context of any netfilter hook.

Since this would be running its checks in the context of a process,
some of the existing expensive or deprecated matches such as the
complex "owner" matches would become much more feasible in , since
they'd be able to just check the properties of "current". Also, we'd
probably add new matches such as "cgroup" which would match based on a
cgroup-provided ID.

Now, we could approximate this using regular packet filtering, but
that has some drawbacks such as:

- additional per-packet processing (some of the match expressions
could get rather complex if you have tens of jobs on a machine each
with their own permitted sets of remote destinations).

- doesn't solve the problem of people listening on ports that are
supposed to be reserved (by the job control system) for some other job

- doesn't give such obvious feedback to the user

So what do people think? Is this a crazy idea that should be dropped
ASAP? Or something that you'd be willing to consider patches for?

Paul
