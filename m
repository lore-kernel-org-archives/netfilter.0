From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ABI Breakage - nftnl_rule_parse_attr_cb
Date: Wed, 22 Jun 2022 17:31:57 +0200
Message-ID: <YrM17Qkvoo+JNrT1@salvia>
References: <fb274774-b42e-fce8-7018-2c21a93a4d38@vt.edu>
 <YrLGi2k9+PvMJepi@salvia>
 <CAOg40qjdS1VA9tOOVitryo7eB4HFk5x0Gzp4JX8e5=LSa6RDEw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOg40qjdS1VA9tOOVitryo7eB4HFk5x0Gzp4JX8e5=LSa6RDEw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

On Wed, Jun 22, 2022 at 09:24:25AM -0400, Kiernan George wrote:
> This is the relevant line where I build my header:
> nlh = nftnl_rule_nlmsg_build_hdr(mnl_nlmsg_batch_current(batch),
> NFT_MSG_NEWRULE, family, NLM_F_APPEND | NLM_F_EXCL | NLM_F_CREATE |
> NLM_F_ECHO | NLM_F_ACK, seq++);
> 
> If I remove NLM_F_ECHO, it fixes my issue, but I would prefer to keep
> this unless there is a better way to get the created rule's handle. I
> also set the handle directly:
> mnl_attr_put_u64(nlh, NFTNL_RULE_POSITION, htobe64(handle));

Makes no sense. Flags are irrelevant for the ABI breakage you are
reporting. Send us a reproducer.
