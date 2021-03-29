From: =?UTF-8?Q?Major_D=c3=a1vid?= <major.david@balasys.hu>
Subject: Keep track extra information about conntrack entries
Date: Mon, 29 Mar 2021 12:21:14 +0200
Message-ID: <ef1ed01e-329a-dc03-78d2-bf14da602f91@balasys.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

I am working on a small kernel module and iptables target which try to
associate some extra information to conntrack entries. I've created a
hash table (struct rhashtable) with u32 hash keys generated from the
conntrack entry's tuple (struct nf_conntrack_tuple). When a connection
ends and the conntrack entries are destroyed I have to remove my own
data as well, for this purpose I've registered with
nf_conntrack_register_notifier to IPCT_DESTROY events. This works
almost every time but there are cases when (as I saw when a connection
is not became ESTABLISHED) there is no destroy event.

What I would like to ask that is there any reason why the IPCT_DESTROY
event is omitted in some cases or is there a different better approach
to "attach" information to conntrack entries?

I thought maybe I have to implement some kind of time based GC to
remove my entries regardless of the conntrack entry status.

Thanks for your help,
David Major

