From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: DisableExternalCache on conntrackd 0.9.14 not syncing to kernel
Date: Thu, 28 Jul 2011 17:22:55 +0200
Message-ID: <4E317ECF.3020404@tolaris.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090201000501010908050503"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------090201000501010908050503
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I've configured two routers, in active-backup mode, but where both can
route to all endpoints at all times. Under some circumstances, traffic
can enter at the backup. So I'm trying to provide either a full
active-active asymmetric solution, or at least active-active symmetric,
where the backup has the active's sessions in the kernel table at all times.

Two questions:

1. "Mode FTFW { DisableExternalCache Off }" does not appear to work as
advertised. The backup router continues to show connections in "cache
external", and these connections are not synced to the local kernel. Can
you tell me why?

2. Does anyone have advice on the best way practice to configure
conntrackd for complete active/active asymmetric routing? I want to
avoid flushing sessions at failover, and just have them sync state full
time.

Details:

conntrackd is 0.9.14-2ubuntu1 on Ubuntu 10.04 lucid. This is the package
Ubuntu provides for 11.04 natty, backported to lucid. The package is
unchanged from the Ubuntu sources. All else is stock lucid.

Both routers are configured as in the attached file (with the exception
of IPv4_interface).

Regards,
Tyler

-- 
"A human being should be able to change a diaper, plan an invasion,
butcher a hog, conn a ship, design a building, write a sonnet, balance
accounts, build a wall, set a bone, comfort the dying, take orders, give
orders, cooperate, act alone, solve equations, analyze a new problem,
pitch manure, program a computer, cook a tasty meal, fight efficiently,
die gallantly. Specialization is for insects."
   -- Lazarus Long, "Time Enough for Love", by Robert A. Heinlein


--------------090201000501010908050503
Content-Type: text/plain;
 name="conntrackd.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="conntrackd.conf"

#
# General settings
#
General {
	#
	# Number of buckets in the caches: hash table
	#
	HashSize 1307648

	#
	# Maximum number of conntracks: 
	# it must be >= $ cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
	#
	HashLimit 2614630

	#
	# Logfile: on (/var/log/conntrackd.log), off, or a filename
	# Default: off
	#
	#LogFile on

	#
	# Syslog: on, off or a facility name (daemon (default) or local0..7)
	# Default: off
	#
	Syslog on

	#
	# Lockfile
	# 
	LockFile /var/lock/conntrackd.lock

	#
	# Unix socket configuration
	#
	UNIX {
		Path /var/run/conntrackd.sock
		Backlog 20
	}

	#
	# Netlink socket buffer size
	#
	SocketBufferSize 262142

	#
	# Increase the socket buffer up to maximun if required
	#
	SocketBufferSizeMaxGrown 655355

	#
	# Event filtering: This clause allows you to filter certain traffic,
	# There are currently three filter-sets: Protocol, Address and
	# State. The filter is attached to an action that can be: Accept or
	# Ignore. Thus, you can define the event filtering policy of the
	# filter-sets in positive or negative logic depending on your needs.
	#
	Filter {
		#
		# Accept only certain protocols: You may want to log the
		# state of flows depending on their layer 4 protocol.
		#
		Protocol Accept {
			TCP
		}

		#
		# Ignore traffic for a certain set of IP's.
		#
		Address Ignore {
			IPv4_address 127.0.0.1 # loopback
		}

		#
		# Uncomment this line below if you want to filter by flow state.
		# The existing TCP states are: SYN_SENT, SYN_RECV, ESTABLISHED,
		# FIN_WAIT, CLOSE_WAIT, LAST_ACK, TIME_WAIT, CLOSED, LISTEN.
		#
		# State Accept {
		#	ESTABLISHED CLOSED TIME_WAIT CLOSE_WAIT for TCP
		# }
	}
}

# 2011-07-28 tyler - see:
# http://conntrack-tools.netfilter.org/manual.html
# /usr/share/doc/conntrackd/examples/sync/notrack/conntrackd.conf.gz

Sync {
#	Mode NOTRACK { }
#	Mode FTFW {
#		DisableExternalCache Off
#	}
	Mode FTFW { }
	Multicast {
		IPv4_address 225.0.0.50
		Group 3780
		IPv4_interface 10.10.2.57
		Interface vlan43
		SndSocketBuffer 1249280
		RcvSocketBuffer 1249280
		Checksum on
	}
}

--------------090201000501010908050503--
