From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: [patch v3] doc: add nf_conntrack sysctl api documentation
Date: Sat, 19 Jan 2013 23:56:43 -0500
Message-ID: <201301192356.43174.neal.p.murphy@alum.wpi.edu>
References: <1358499908-1268-1-git-send-email-jiri@resnulli.us>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1358499908-1268-1-git-send-email-jiri@resnulli.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Grammar nazi again. I grok that these were pulled from code. If they're OK, 
maybe they can find their way back to the source files in due time.

N

On Friday, January 18, 2013 04:05:08 AM Jiri Pirko wrote:

> diff --git a/Documentation/networking/nf_conntrack-sysctl.txt
> b/Documentation/networking/nf_conntrack-sysctl.txt new file mode 100644
> index 0000000..11e450e
> --- /dev/null
> +++ b/Documentation/networking/nf_conntrack-sysctl.txt
> @@ -0,0 +1,177 @@
> +/proc/sys/net/netfilter/nf_conntrack_* Variables:
> +
> +nf_conntrack_acct - BOOLEAN
> +	0 - disabled (default)
> +	not 0 - enabled
> +
> +	Enable connection tracking flow accounting. 64-bits byte and packet

Make it '64-bit' (singular).

> +	counters per flow are added.
> +
> +nf_conntrack_buckets - INTEGER (read-only)
> +	Size of hash table.  Value depends on total memory size according to
> +	following rules:
> +	Use 1/16384 of memory.
> +	If memory size is bigger than 1GB have 16384 buckets.
> +	Minimum value is 32.

This might be clearer: "Size of hash table. Divide total memory by 16384 to 
determine the number of buckets. But the hash table will never have fewer than 
32 or more than 16384 buckets."

> +
> +nf_conntrack_checksum - BOOLEAN
> +	0 - disabled
> +	not 0 - enabled (default)
> +
> +	Verify checksum of incoming packets.  Packets with bad checksum
> +	will not be considered for connection tracking, i.e. such packets
> +	will be in INVALID state.

Perhaps clearer: "... Packets with bad checksums are in INVALID state. If this 
is enabled, such packets will not be considered for connection tracking."

> +
> +nf_conntrack_count - INTEGER (read-only)
> +	Number of currently allocated flow entries.
> +
> +nf_conntrack_events - BOOLEAN
> +	0 - disabled
> +	not 0 - enabled (default)
> +
> +	If this option is enabled, the connection tracking code will
> +	provide userspace with connection tracking events via ctnetlink.
> +
> +nf_conntrack_events_retry_timeout - INTEGER (seconds)
> +	default 15
> +
> +	This option is only relevant when "reliable connection tracking
> +	events" are used.  Normally, ctnetlink is "lossy", i.e. when
> +	userspace listeners can't keep up, events are dropped.

Minor tweak: "... Cnetlink is normally "lossy"; that is, events are normally 
dropped when userspace listeners can't keep up."

> +
> +	Userspace can request "reliable event mode".  When this mode is
> +	active, the conntrack will only be destroyed after the event was
> +	delivered.  If event delivery fails, the kernel periodically
> +	re-tries to send the event to userspace.
> +
> +	This is the maximum interval the kernel should use when re-trying
> +	to deliver the destroy event.
> +
> +	Higher number means less delivery re-tries (but it will then take
> +	longer for a backlog to be processed).

Better: "A higher number means there will be fewer delivery retries and it 
will take longer for a backlog to be processed."

> +
> +nf_conntrack_expect_max - INTEGER
> +	Maximum size of expectation table.  Default value is
> +	nf_conntrack_buckets / 256. Minimum is 1.
> +
> +nf_conntrack_frag6_high_thresh - INTEGER
> +	default 262144
> +

> ...

> > +nf_conntrack_tcp_loose - BOOLEAN
> +	0 - disabled
> +	not 0 - enabled (default)
> +
> +	If it is set to zero, we disable picking up already established
> +	connections.
> +
> +nf_conntrack_tcp_max_retrans - INTEGER
> +	default 3
> +
> +	Max number of the retransmitted packets without receiving an
> +	(acceptable) ACK from the destination.  If this number is reached,
> +	a shorter timer will be started.

Maybe better: "Maximum number of packets that can be retransmitted without 
receiving an ..."

> +
> +nf_conntrack_tcp_timeout_close - INTEGER (seconds)
> +	default 10
> +
> +nf_conntrack_tcp_timeout_close_wait - INTEGER (seconds)
> +	default 60
> +
