From: Arnt Karlsen <arnt@c2i.net>
Subject: ..newbie try tweaking pom-base kernels on throttle and router
Date: Mon, 11 Nov 2002 13:50:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111135048.39be041f.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi, 

..I got myself into firewalling and throttling bandwidth for about 
400 boxes, some 25 web/mail servers, the remainder "work"stations, 
mostly wintendos, in 5 different locations, whom I throttle to 
400kbps in and 200kbps out.  With 100Mbps copper and optic wiring 
and not (we also use 802.11 to link locations), we have 10Mbps 
upwards.  And chug along at 1.5 to 2.5 Mbps with no big load on 
the hardware.  So, I'm looking into the /proc/sys/net/ipv*/* tree.

..the default settings are fine for your average workstartion 
hung on a tired copper wire.  Below is my first shot in the dark,
opinions, experience, suggestion?  How far off am I?

#!/bin/bash 
# #####################################################################
# ..setting the /proc/sys/net/ipv4/* Variables:
# 
# ..service: 2 boxes: A gateway router (gwr) for a /27 (isp servers), 
# 2 ea /26 and 2ea /25 nets, (ip clients) and a throttling bridge (tb)
# hung outside the above gwr, with an admin interface inside the gwr. 
# Hw: duron 1.2GHz, 256MB ram (128MB for tb), sw: Red Hat 7.3, on
# Red Hats own errata 2.4.18-17.x with pom-base patches 
# (http://www.netfilter.org/documentation/pomlist/pom-combined.html).
# 
# ..now, the tweaking:  How far off am I?
# 
# ip_forward - BOOLEAN
# 	0 - disabled (default)
# 	not 0 - enabled 
# 
# 	Forward Packets between interfaces.
# 
# 	This variable is special, its change resets all configuration
# 	parameters to their default state (RFC1122 for hosts, RFC1812
# 	for routers)
# 
echo "1"  > /proc/sys/net/ipv4/ip_forward
#
# ip_default_ttl - INTEGER
# 	default 64
# 
# 
echo "64"  > /proc/sys/net/ipv4/ip_default_ttl
#
# 
# ip_no_pmtu_disc - BOOLEAN
# 	Disable Path MTU Discovery.
# 	default FALSE
# 
echo "0"  > /proc/sys/net/ipv4/ip_no_pmtu_disc
#
# 
# IP Fragmentation:
# 
# ipfrag_high_thresh - INTEGER  ( ..up from 262144 )
# 	Maximum memory used to reassemble IP fragments. When 
# 	ipfrag_high_thresh bytes of memory is allocated for this
# 	purpose, the fragment handler will toss packets until
# 	ipfrag_low_thresh is reached.  
# 
echo "1048576"  > /proc/sys/net/ipv4/ipfrag_high_thresh
# 
# 	
# ipfrag_low_thresh - INTEGER
# 	See ipfrag_high_thresh	
# 
echo "196608"  > /proc/sys/net/ipv4/ipfrag_low_thresh
#
# 
# ipfrag_time - INTEGER	( ..down from 30 )
# 	Time in seconds to keep an IP fragment in memory.	
# 
echo "5"  > /proc/sys/net/ipv4/ipfrag_time
#
# 
# INET peer storage:
# 
# inet_peer_threshold - INTEGER
# 	The approximate size of the storage.  Starting from this
# 	threshold	entries will be thrown aggressively.  This threshold
# 	also determines entries' time-to-live and time intervals between
# 	garbage collection passes.  More entries, less time-to-live,
# 	less GC interval.
# 
echo "65664"  > /proc/sys/net/ipv4/inet_peer_threshold
#
# 
# inet_peer_minttl - INTEGER
# 	Minimum time-to-live of entries.  Should be enough to cover
# 	fragment time-to-live on the reassembling side.  This minimum
# 	time-to-live  is guaranteed if the pool size is less than
# 	inet_peer_threshold. Measured in jiffies(1).
# 
echo "120"  > /proc/sys/net/ipv4/inet_peer_minttl
#
# 
# inet_peer_maxttl - INTEGER
# 	Maximum time-to-live of entries.  Unused entries will expire
# 	after this period of time if there is no memory pressure on the
# 	pool (i.e. when the number of entries in the pool is very
# 	small). Measured in jiffies(1).
# 
echo "600"  > /proc/sys/net/ipv4/inet_peer_maxttl
#
# 
# inet_peer_gc_mintime - INTEGER
# 	Minimum interval between garbage collection passes.  This
# 	interval is in effect under high memory pressure on the pool.
# 	Measured in jiffies(1).
# 
echo "10"  > /proc/sys/net/ipv4/inet_peer_gc_mintime
#
# 
# inet_peer_gc_maxtime - INTEGER
# 	Minimum interval between garbage collection passes.  This
# 	interval is in effect under low (or absent) memory pressure on
# 	the pool. Measured in jiffies(1).
# 
echo "120"  > /proc/sys/net/ipv4/inet_peer_gc_maxtime
#
# 
# TCP variables: 
# 
# tcp_syn_retries - INTEGER
# 	Number of times initial SYNs for an active TCP connection
# 	attempt will be retransmitted. Should not be higher than 255.
# 	Default value is 5, which corresponds to ~180seconds.
# 
echo "2"  > /proc/sys/net/ipv4/tcp_syn_retries
#
# 
# tcp_synack_retries - INTEGER
# 	Number of times SYNACKs for a passive TCP connection attempt
# 	will be retransmitted. Should not be higher than 255. Default
# 	value is 5, which corresponds to ~180seconds.
# 
echo "2"  > /proc/sys/net/ipv4/tcp_synack_retries
#
# 
# tcp_keepalive_time - INTEGER
# 	How often TCP sends out keepalive messages when keepalive is
# 	enabled. Default: 2hours.
# 
echo "300"  > /proc/sys/net/ipv4/tcp_keepalive_time
#
# 
# tcp_keepalive_probes - INTEGER
# 	How many keepalive probes TCP sends out, until it decides that
# 	the connection is broken. Default value: 9.
# 
echo "3"  > /proc/sys/net/ipv4/tcp_keepalive_probes
#
# 
# tcp_keepalive_intvl - INTEGER
# 	How frequently the probes are send out. Multiplied by
# 	tcp_keepalive_probes it is time to kill not responding
# 	connection, after probes started. Default value: 75sec i.e.
# 	connection will be aborted after ~11 minutes of retries.
# 
echo "60"  > /proc/sys/net/ipv4/tcp_keepalive_intvl
#
# 
# tcp_retries1 - INTEGER
# 	How many times to retry before deciding that something is wrong
# 	and it is necessary to report this suspection to network layer.
# 	Minimal RFC value is 3, it is default, which corresponds
# 	to ~3sec-8min depending on RTO.
# 
echo "2"  > /proc/sys/net/ipv4/tcp_retries1
#
# 
# tcp_retries2 - INTEGER
# 	How may times to retry before killing alive TCP connection.
# 	RFC1122 says that the limit should be longer than 100 sec.
# 	It is too small number.	Default value 15 corresponds to
# 	~13-30min depending on RTO.
# 
echo "2"  > /proc/sys/net/ipv4/tcp_retries2
#
# 
# tcp_orphan_retries - INTEGER
# 	How may times to retry before killing TCP connection, closed
# 	by our side. Default value 7 corresponds to ~50sec-16min
# 	depending on RTO. If you machine is loaded WEB server,
# 	you should think about lowering this value, such sockets
# 	may consume significant resources. Cf. tcp_max_orphans.
# 
echo "2"  > /proc/sys/net/ipv4/tcp_orphan_retries
#
# 
# tcp_fin_timeout - INTEGER
# 	Time to hold socket in state FIN-WAIT-2, if it was closed
# 	by our side. Peer can be broken and never close its side,
# 	or even died unexpectedly. Default value is 60sec.
# 	Usual value used in 2.2 was 180 seconds, you may restore
# 	it, but remember that if your machine is even underloaded WEB
# 	server, you risk to overflow memory with kilotons of dead
# 	sockets, FIN-WAIT-2 sockets are less dangerous than FIN-WAIT-1,
# 	because they eat maximum 1.5K of memory, but they tend
# 	to live longer.	Cf. tcp_max_orphans.
# 
echo "15"  > /proc/sys/net/ipv4/tcp_fin_timeout
#
# 
# tcp_max_tw_buckets - INTEGER
# 	Maximal number of timewait sockets held by system
# 	simultaneously. If this number is exceeded time-wait socket is
# 	immediately destroyed and warning is printed. This limit exists
# 	only to prevent simple DoS attacks, you _must_ not lower the
# 	limit artificially, but rather increase it (probably, after
# 	increasing installed memory), if network conditions require more
# 	than default value.
# 
echo "180000"  > /proc/sys/net/ipv4/tcp_max_tw_buckets
#
# 
# tcp_tw_recycle - BOOLEAN
# 	Enable fast recycling TIME-WAIT sockets. Default value is 0.
# 	It should not be changed without advice/request of technical
# 	experts.
# 
echo "0"  > /proc/sys/net/ipv4/tcp_tw_recycle
#
# 
# tcp_tw_reuse - BOOLEAN
# 	Allow to reuse TIME-WAIT sockets for new connections when it is
# 	safe from protocol viewpoint. Default value is 0.
# 	It should not be changed without advice/request of technical
# 	experts.
# 
echo "0"  > /proc/sys/net/ipv4/tcp_tw_reuse
#
# 
# tcp_max_orphans - INTEGER
# 	Maximal number of TCP sockets not attached to any user file
# 	handle, held by system.	If this number is exceeded orphaned
# 	connections are reset immediately and warning is printed. This
# 	limit exists only to prevent simple DoS attacks, you _must_ not
# 	rely on this or lower the limit artificially, but rather
# 	increase it(probably, after increasing installed memory),
# 	if network conditions require more than default value,
# 	and tune network services to linger and kill such states
# 	more aggressively. Let me to remind again: each orphan eats
# 	up to ~64K of unswappable memory.
# 
echo "16384"  > /proc/sys/net/ipv4/tcp_max_orphans
#
# 
# tcp_abort_on_overflow - BOOLEAN
# 	If listening service is too slow to accept new connections,
# 	reset them. Default state is FALSE. It means that if overflow
# 	occurred due to a burst, connection will recover. Enable this
# 	option _only_ if you are really sure that listening daemon
# 	cannot be tuned to accept connections faster. Enabling this
# 	option can harm clients of your server.
# 
echo "0"  > /proc/sys/net/ipv4/tcp_abort_on_overflow
#
# 
# tcp_syncookies - BOOLEAN
# 	Only valid when the kernel was compiled with CONFIG_SYNCOOKIES
# 	Send out syncookies when the syn backlog queue of a socket 
# 	overflows. This is to prevent against the common 'syn flood
# 	attack' Default: FALSE
# 
# 	Note, that syncookies is fallback facility.
# 	It MUST NOT be used to help highly loaded servers to stand
# 	against legal connection rate. If you see synflood warnings
# 	in your logs, but investigation	shows that they occur
# 	because of overload with legal connections, you should tune
# 	another parameters until this warning disappear.
# 	See: tcp_max_syn_backlog, tcp_synack_retries,
# 	tcp_abort_on_overflow.
# 
# 	syncookies seriously violate TCP protocol, do not allow
# 	to use TCP extensions, can result in serious degradation
# 	of some services (f.e. SMTP relaying), visible not by you,
# 	but your clients and relays, contacting you. While you see
# 	synflood warnings in logs not being really flooded, your server
# 	is seriously misconfigured.
# 
echo "0"  > /proc/sys/net/ipv4/tcp_syncookies
#
# 
# tcp_stdurg - BOOLEAN
# 	Use the Host requirements interpretation of the TCP urg pointer
# 	field. Most hosts use the older BSD interpretation, so if you
# 	turn this on Linux might not communicate correctly with them.	
# 	Default: FALSE 
# 
echo "0"  > /proc/sys/net/ipv4/tcp_stdurg
#
# 	
# tcp_max_syn_backlog - INTEGER
# 	Maximal number of remembered connection requests, which are
# 	still did not receive an acknowledgement from connecting client.
# 	Default value is 1024 for systems with more than 128Mb of
# 	memory, and 128 for low memory machines. If server suffers of
# 	overload, try to increase this number.
# 
echo "2048"  > /proc/sys/net/ipv4/tcp_max_syn_backlog
#
# 
# tcp_window_scaling - BOOLEAN
# 	Enable window scaling as defined in RFC1323.
# 
echo "1"  > /proc/sys/net/ipv4/tcp_window_scaling
#
# 
# tcp_timestamps - BOOLEAN
# 	Enable timestamps as defined in RFC1323.
# 
echo "1"  > /proc/sys/net/ipv4/tcp_timestamps
#
# 
# tcp_sack - BOOLEAN
# 	Enable select acknowledgments (SACKS).
# 
echo "1"  > /proc/sys/net/ipv4/tcp_sack
#
# 
# tcp_fack - BOOLEAN
# 	Enable FACK congestion avoidance and fast restransmission.
# 	The value is not used, if tcp_sack is not enabled.
# 
echo "1"  > /proc/sys/net/ipv4/tcp_fack
#
# 
# tcp_dsack - BOOLEAN
# 	Allows TCP to send "duplicate" SACKs.
# 
echo "1"  > /proc/sys/net/ipv4/tcp_dsack
#
# 
# tcp_ecn - BOOLEAN
# 	Enable Explicit Congestion Notification in TCP.
# 
echo "1"  > /proc/sys/net/ipv4/tcp_ecn
#
# 
# tcp_reordering - INTEGER
# 	Maximal reordering of packets in a TCP stream.
# 	Default: 3	
# 
echo "3"  > /proc/sys/net/ipv4/tcp_reordering
#
# 
# tcp_retrans_collapse - BOOLEAN
# 	Bug-to-bug compatibility with some broken printers.
# 	On retransmit try to send bigger packets to work around bugs in
# 	certain TCP stacks.
# 
echo "1"  > /proc/sys/net/ipv4/tcp_retrans_collapse
#
# 
# tcp_wmem - vector of 3 INTEGERs: min, default, max
# 	min: Amount of memory reserved for send buffers for TCP socket.
# 	Each TCP socket has rights to use it due to fact of its birth.
# 	Default: 4K
# 
# 	default: Amount of memory allowed for send buffers for TCP
# 	socket by default. This value overrides net.core.wmem_default
# 	used by other protocols, it is usually lower than
# 	net.core.wmem_default. Default: 16K
# 
# 	max: Maximal amount of memory allowed for automatically selected
# 	send buffers for TCP socket. This value does not override
# 	net.core.wmem_max, "static" selection via SO_SNDBUF does not use
# 	this. Default: 128K
# 
echo "4096	16384	131072  "  > /proc/sys/net/ipv4/tcp_wmem
#
# 
# tcp_rmem - vector of 3 INTEGERs: min, default, max
# 	min: Minimal size of receive buffer used by TCP sockets.
# 	It is guaranteed to each TCP socket, even under moderate memory
# 	pressure.
# 	Default: 8K
# 
# 	default: default size of receive buffer used by TCP sockets.
# 	This value overrides net.core.rmem_default used by other
# 	protocols. Default: 87380 bytes. This value results in window of
# 	65535 with default setting of tcp_adv_win_scale and
# 	tcp_app_win:0 and a bit less for default tcp_app_win. See below
# 	about these variables.
# 
# 	max: maximal size of receive buffer allowed for automatically
# 	selected receiver buffers for TCP socket. This value does not
# 	override net.core.rmem_max, "static" selection via SO_RCVBUF
# 	does not use this. Default: 87380*2 bytes.
# 
echo "4096	87380	174760"  > /proc/sys/net/ipv4/tcp_rmem
#
# 
# tcp_mem - vector of 3 INTEGERs: min, pressure, max
# 	low: below this number of pages TCP is not bothered about its
# 	memory appetite.
# 
# 	pressure: when amount of memory allocated by TCP exceeds this
# 	number of pages, TCP moderates its memory consumption and enters
# 	memory pressure mode, which is exited when memory consumtion
# 	falls under "low".
# 
# 	high: number of pages allowed for queueing by all TCP sockets.
# 
# 	Defaults are calculated at boot time from amount of available
# 	memory.
# 
echo "97280	97792	98304" > /proc/sys/net/ipv4/tcp_mem
#
# 
# tcp_app_win - INTEGER
# 	Reserve max(window/2^tcp_app_win, mss) of window for application
# 	buffer. Value 0 is special, it means that nothing is reserved.
# 	Default: 31
# 
echo "31"  > /proc/sys/net/ipv4/tcp_app_win
#
# 
# tcp_adv_win_scale - INTEGER
# 	Count buffering overhead as bytes/2^tcp_adv_win_scale
# 	(if tcp_adv_win_scale # 0) or
# 	bytes-bytes/2^(-tcp_adv_win_scale), if it is <= 0.
# 	Default: 2
# 
echo "2"  > /proc/sys/net/ipv4/tcp_adv_win_scale
#
# 
# tcp_rfc1337 - BOOLEAN
# 	If set, the TCP stack behaves conforming to RFC1337. If unset,
# 	we are not conforming to RFC, but prevent TCP TIME_WAIT
# 	asassination.	
# 	Default: 0
# 
echo "0"  > /proc/sys/net/ipv4/tcp_rfc1337
#
# 
# ip_local_port_range - 2 INTEGERS
# 	Defines the local port range that is used by TCP and UDP to
# 	choose the local port. The first number is the first, the 
# 	second the last local port number. Default value depends on
# 	amount of memory available on the system:
# 	# 128Mb 32768-61000
# 	< 128Mb 1024-4999 or even less.
# 	This number defines number of active connections, which this
# 	system can issue simultaneously to systems not supporting
# 	TCP extensions (timestamps). With tcp_tw_recycle enabled
# 	(i.e. by default) range 1024-4999 is enough to issue up to
# 	2000 connections per second to systems supporting timestamps.
# 
echo "32768	61000"  > /proc/sys/net/ipv4/ip_local_port_range
#
# 
# ip_nonlocal_bind - BOOLEAN
# 	If set, allows processes to bind() to non-local IP adresses,
# 	which can be quite useful - but may break some applications.
# 	Default: 0
# 
echo "0"  > /proc/sys/net/ipv4/ip_nonlocal_bind
#
# 
# ip_dynaddr - BOOLEAN
# 	If set non-zero, enables support for dynamic addresses.
# 	If set to a non-zero value larger than 1, a kernel log
# 	message will be printed when dynamic address rewriting
# 	occurs.
# 	Default: 0
# 
echo "0"  > /proc/sys/net/ipv4/ip_dynaddr
#
# 
# icmp_echo_ignore_all - BOOLEAN
# icmp_echo_ignore_broadcasts - BOOLEAN
# 	If either is set to true, then the kernel will ignore either all
# 	ICMP ECHO requests sent to it or just those to
# 	broadcast/multicast addresses, respectively.
# 
echo "0"  > /proc/sys/net/ipv4/icmp_echo_ignore_all
#
# 
# icmp_ratelimit - INTEGER
# 	Limit the maximal rates for sending ICMP packets whose type
# 	matches icmp_ratemask (see below) to specific targets.
# 	0 to disable any limiting, otherwise the maximal rate in
# 	jiffies(1) Default: 100
# 
echo "100"  > /proc/sys/net/ipv4/icmp_ratelimit
#
# 
# icmp_ratemask - INTEGER
# 	Mask made of ICMP types for which rates are being limited.
# 	Significant bits: IHGFEDCBA9876543210
# 	Default mask:     0000001100000011000 (6168)
# 
# 	Bit definitions (see include/linux/icmp.h):
# 		0 Echo Reply
# 		3 Destination Unreachable *
# 		4 Source Quench *
# 		5 Redirect
# 		8 Echo Request
# 		B Time Exceeded *
# 		C Parameter Problem *
# 		D Timestamp Request
# 		E Timestamp Reply
# 		F Info Request
# 		G Info Reply
# 		H Address Mask Request
# 		I Address Mask Reply
# 
# 	* These are rate limited by default (see default mask above)
# 
echo "6168"  > /proc/sys/net/ipv4/icmp_ratemask
#
# 
# icmp_ignore_bogus_error_responses - BOOLEAN
# 	Some routers violate RFC1122 by sending bogus responses to
# 	broadcast frames.  Such violations are normally logged via a
# 	kernel warning. If this is set to TRUE, the kernel will not give
# 	such warnings, which will avoid log file clutter.
# 	Default: FALSE
# 
echo "0"  > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
#
# 
# igmp_max_memberships - INTEGER
# 	Change the maximum number of multicast groups we can subscribe
# 	to. Default: 20
# 
echo "20"  > /proc/sys/net/ipv4/igmp_max_memberships
#
# 
# conf/interface/*: 
# conf/all/* is special and changes the settings for all interfaces.
# 	Change special settings per interface.
# 
echo "1"  > /proc/sys/net/ipv4/\/
#
# 
# log_martians - BOOLEAN
# 	Log packets with impossible addresses to kernel log.
# 
echo "1"  > /proc/sys/net/ipv4/\/log_martians
#
# 
# accept_redirects - BOOLEAN
# 	Accept ICMP redirect messages.
# 	default TRUE (host)
# 		FALSE (router)
# 
echo "1"  > /proc/sys/net/ipv4/\/accept_redirects
#
# 
# forwarding - BOOLEAN
# 	Enable IP forwarding on this interface.
# 
echo "1"  > /proc/sys/net/ipv4/\/forwarding
#
# 
# mc_forwarding - BOOLEAN
# 	Do multicast routing. The kernel needs to be compiled with
# CONFIG_MROUTE	and a multicast routing daemon is required.
# 
echo "1"  > /proc/sys/net/ipv4/\/mc_forwarding
#
# 
# medium_id - INTEGER
# 	Integer value used to differentiate the devices by the medium
# 	they are attached to. Two devices can have different id values
# 	when the broadcast packets are received only on one of them.
# 	The default value 0 means that the device is the only interface
# 	to its medium, value of -1 means that medium is not known.
# 	
# 	Currently, it is used to change the proxy_arp behavior:
# 	the proxy_arp feature is enabled for packets forwarded between
# 	two devices attached to different media.
# 
echo "1"  > /proc/sys/net/ipv4/\/medium_id
#
# 
# proxy_arp - BOOLEAN
# 	Do proxy arp.
# 
echo "1"  > /proc/sys/net/ipv4/\/proxy_arp
# 
# 
# shared_media - BOOLEAN
# 	Send(router) or accept(host) RFC1620 shared media redirects.
# 	Overrides ip_secure_redirects.
# 	default TRUE
# 
echo "1"  > /proc/sys/net/ipv4/\/shared_media
# 
# 
# secure_redirects - BOOLEAN
# 	Accept ICMP redirect messages only for gateways,
# 	listed in default gateway list.
# 	default TRUE
# 
echo "1"  > /proc/sys/net/ipv4/\/secure_redirects
# 
# 
# send_redirects - BOOLEAN
# 	Send redirects, if router. Default: TRUE
# 
echo "1"  > /proc/sys/net/ipv4/\/send_redirects
# 
# 
# bootp_relay - BOOLEAN
# 	Accept packets with source address 0.b.c.d destined
# 	not to this host as local ones. It is supposed, that
# 	BOOTP relay daemon will catch and forward such packets.
# 
# 	default FALSE
# 	Not Implemented Yet.
# 
echo "1"  > /proc/sys/net/ipv4/\/bootp_relay
# 
# 
# accept_source_route - BOOLEAN
# 	Accept packets with SRR option.
# 	default TRUE (router)
# 		FALSE (host)
# 
echo "1"  > /proc/sys/net/ipv4/\/accept_source_route
# 
# 
# rp_filter - BOOLEAN
# 	1 - do source validation by reversed path, as specified in
# 	RFC1812
# 	    Recommended option for single homed hosts and stub network
# 	    routers. Could cause troubles for complicated (not loop
# 	    free) networks running a slow unreliable protocol (sort of
# 	    RIP), or using static routes.
# 
# 	0 - No source validation. 
# 
# 	Default value is 0. Note that some distributions enable it
# 	in startup scripts.
# 
echo "1"  > /proc/sys/net/ipv4/\/rp_filter
# 
# 
# arp_filter - BOOLEAN
# 	1 - Allows you to have multiple network interfaces on the same
# 	subnet, and have the ARPs for each interface be answered
# 	based on whether or not the kernel would route a packet from
# 	the ARP'd IP out that interface (therefore you must use source
# 	based routing for this to work). In other words it allows
# 	control of which cards (usually 1) will respond to an arp
# 	request.
# 
# 	0 - (default) The kernel can respond to arp requests with
# 	addresses from other interfaces. This may seem wrong but it
# 	usually makes sense, because it increases the chance of
# 	successful communication. IP addresses are owned by the complete
# 	host on Linux, not by particular interfaces. Only for more
# 	complex setups like load- balancing, does this behaviour cause
# 	problems.
# 
echo "1"  > /proc/sys/net/ipv4/\/arp_filter
# 
# 
# tag - INTEGER
# 	Allows you to write a number, which can be used as required.
# 	Default value is 0.
# 
echo "1"  > /proc/sys/net/ipv4/\/tag
# 
# 
# (1) Jiffie: internal timeunit for the kernel. On the i386 1/100s, on
# the Alpha 1/1024s. See the HZ define in /usr/include/asm/param.h for
# the exact value on your system. 
# 
# Alexey Kuznetsov.
# kuznet@ms2.inr.ac.ru
# 
# Updated by:
# Andi Kleen
# ak@muc.de
# 
# 
####################################################################### 
#######################################################################
# 
# 
# /proc/sys/net/ipv6/* Variables:
# 
# IPv6 has no global variables such as tcp_*.  tcp_* settings under
# ipv4/ also apply to IPv6 [XXX?].
# 
# conf/default/*:
# 	Change the interface-specific default settings.
# 
# 
# conf/all/*:
# 	Change all the interface-specific settings.  
# 
# 	[XXX:  Other special features than forwarding?]
# 
# conf/all/forwarding - BOOLEAN
# 	Enable global IPv6 forwarding between all interfaces.  
# 
# 	IPv4 and IPv6 work differently here; e.g. netfilter must be used
# 	to control which interfaces may forward packets and which not.
# 
# 	This also sets all interfaces' Host/Router setting 
# 	'forwarding' to the specified value.  See below for details.
# 
# 	This referred to as global forwarding.
# 
# conf/interface/*:
# 	Change special settings per interface.
# 
# 	The functional behaviour for certain settings is different 
# 	depending on whether local forwarding is enabled or not.
# 
# accept_ra - BOOLEAN
# 	Accept Router Advertisements; autoconfigure using them.
# 	
# 	Functional default: enabled if local forwarding is disabled.
# 			    disabled if local forwarding is enabled.
# 
echo "1"    > /proc/sys/net/ipv6/\/accept_ra
#
# 
# accept_redirects - BOOLEAN
# 	Accept Redirects.
# 
# 	Functional default: enabled if local forwarding is disabled.
# 			    disabled if local forwarding is enabled.
# 
echo "1"    > /proc/sys/net/ipv6/\/accept_redirects
#
# 
# autoconf - BOOLEAN
# 	Configure link-local addresses using L2 hardware addresses.
# 
# 	Default: TRUE
# 
echo "1"    > /proc/sys/net/ipv6/\/autoconf
#
# 
# dad_transmits - INTEGER
# 	The amount of Duplicate Address Detection probes to send.
# 	Default: 1
# 
echo "1"    > /proc/sys/net/ipv6/\/dad_transmits
#
# 	
# forwarding - BOOLEAN
# 	Configure interface-specific Host/Router behaviour.  
# 
# 	Note: It is recommended to have the same setting on all 
# 	interfaces; mixed router/host scenarios are rather uncommon.
# 
# 	FALSE:
# 
# 	By default, Host behaviour is assumed.  This means:
# 
# 	1. IsRouter flag is not set in Neighbour Advertisements.
# 	2. Router Solicitations are being sent when necessary.
# 	3. If accept_ra is TRUE (default), accept Router 
# 	   Advertisements (and do autoconfiguration).
# 	4. If accept_redirects is TRUE (default), accept Redirects.
# 
# 	TRUE:
# 
# 	If local forwarding is enabled, Router behaviour is assumed. 
# 	This means exactly the reverse from the above:
# 
# 	1. IsRouter flag is set in Neighbour Advertisements.
# 	2. Router Solicitations are not sent.
# 	3. Router Advertisements are ignored.
# 	4. Redirects are ignored.
# 
# 	Default: FALSE if global forwarding is disabled (default),
# 		 otherwise TRUE.
# 
# # echo "1"    > /proc/sys/net/ipv6/\/forwarding
#
# 
# hop_limit - INTEGER
# 	Default Hop Limit to set.
# 	Default: 64
# 
echo "64"    > /proc/sys/net/ipv6/\/hop_limit
#
# 
# mtu - INTEGER
# 	Default Maximum Transfer Unit
# 	Default: 1280 (IPv6 required minimum)
# 
echo "1280"    > /proc/sys/net/ipv6/\/mtu
#
# 
# router_solicitation_delay - INTEGER
# 	Number of seconds to wait after interface is brought up
# 	before sending Router Solicitations.
# 	Default: 1
# 
echo "1"    > /proc/sys/net/ipv6/\/router_solicitation_delay
#
# 
# router_solicitation_interval - INTEGER
# 	Number of seconds to wait between Router Solicitations.
# 	Default: 4
# 
echo "4"    > /proc/sys/net/ipv6/\/router_solicitation_interval
#
# 
# router_solicitations - INTEGER
# 	Number of Router Solicitations to send until assuming no 
# 	routers are present.
# 	Default: 3
# 
echo "3"    > /proc/sys/net/ipv6/\/router_solicitations
#
# 
# IPv6 Update by:
# Pekka Savola
# pekkas@netcore.fi
# 
# $Id: ip-sysctl.txt,v 1.19.2.1 2001/12/13 08:59:27 davem Exp $
# 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



