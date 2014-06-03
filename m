From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] netfilter: nf_conntrack: fix checkpatch errors
Date: Tue, 03 Jun 2014 20:58:09 +0400
Message-ID: <538DFEA1.1030309@cogentembedded.com>
References: <1401806702-3251-1-git-send-email-luca.ellero@brickedbrain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1401806702-3251-1-git-send-email-luca.ellero@brickedbrain.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Luca Ellero <luca.ellero@brickedbrain.com>, netfilter@vger.kernel.org
Cc: pablo@netfilter.org, kaber@trash.net, kadlec@blackhole.kfki.hu, davem@davemloft.net, coreteam@netfilter.org, netdev@vger.kernel.org

Hello.

On 06/03/2014 06:45 PM, Luca Ellero wrote:

> Add parenthesis around complex macros

    You should have thought a bit before doing that... :-)

> Signed-off-by: Luca Ellero <luca.ellero@brickedbrain.com>
> ---
>   net/netfilter/nf_conntrack_pptp.c       |    6 +++---
>   net/netfilter/nf_conntrack_proto_sctp.c |    8 ++++----
>   net/netfilter/nf_conntrack_proto_tcp.c  |    8 ++++----
>   3 files changed, 11 insertions(+), 11 deletions(-)

> diff --git a/net/netfilter/nf_conntrack_pptp.c b/net/netfilter/nf_conntrack_pptp.c
> index 825c3e3..a505263 100644
> --- a/net/netfilter/nf_conntrack_pptp.c
> +++ b/net/netfilter/nf_conntrack_pptp.c
> @@ -92,9 +92,9 @@ const char *const pptp_msg_name[] = {
>   EXPORT_SYMBOL(pptp_msg_name);
>   #endif
>
> -#define SECS *HZ
> -#define MINS * 60 SECS
> -#define HOURS * 60 MINS
> +#define SECS  (*HZ)
> +#define MINS  (*60 SECS)
> +#define HOURS (*60 MINS)

    This is complete nonsense which would lead to syntax error.

[...]
> diff --git a/net/netfilter/nf_conntrack_proto_sctp.c b/net/netfilter/nf_conntrack_proto_sctp.c
> index 1314d33..387cda5 100644
> --- a/net/netfilter/nf_conntrack_proto_sctp.c
> +++ b/net/netfilter/nf_conntrack_proto_sctp.c
> @@ -44,10 +44,10 @@ static const char *const sctp_conntrack_names[] = {
>   	"SHUTDOWN_ACK_SENT",
>   };
>
> -#define SECS  * HZ
> -#define MINS  * 60 SECS
> -#define HOURS * 60 MINS
> -#define DAYS  * 24 HOURS
> +#define SECS  (*HZ)
> +#define MINS  (*60 SECS)
> +#define HOURS (*60 MINS)
> +#define DAYS  (*24 HOURS)

    This as well.

[...]
> diff --git a/net/netfilter/nf_conntrack_proto_tcp.c b/net/netfilter/nf_conntrack_proto_tcp.c
> index 44d1ea3..6a7d6f8 100644
> --- a/net/netfilter/nf_conntrack_proto_tcp.c
> +++ b/net/netfilter/nf_conntrack_proto_tcp.c
> @@ -63,10 +63,10 @@ static const char *const tcp_conntrack_names[] = {
>   	"SYN_SENT2",
>   };
>
> -#define SECS * HZ
> -#define MINS * 60 SECS
> -#define HOURS * 60 MINS
> -#define DAYS * 24 HOURS
> +#define SECS  (*HZ)
> +#define MINS  (*60 SECS)
> +#define HOURS (*60 MINS)
> +#define DAYS  (*24 HOURS)

    This too.

WBR, Sergei
