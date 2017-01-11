From: Jiri Kosina <jikos@kernel.org>
Subject: Re: conntrackd: synchronization failures
Date: Wed, 11 Jan 2017 21:12:08 +0100 (CET)
Message-ID: <alpine.LRH.2.00.1701112108360.25853@gjva.wvxbf.pm>
References: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: info@jablonka.cz

On Wed, 11 Jan 2017, Jiri Kosina wrote:

> conntrackd.conf can be found below.

.. and now actually included, sorry.

BTW NetlinkOverrunResync and NetlinkEventsReliable don't have any 
significant impact on the issue.


=== cut here ===
Sync {
	Mode FTFW {
		DisableExternalCache On
	}

	UDP {
		IPv4_address 10.33.28.13
		IPv4_Destination_Address 10.33.28.14
		Port 3780
		Interface eth2
	}

}

General {
	Nice -20
	HashSize 32768
	HashLimit 1024000
	LogFile on
	LockFile /var/lock/conntrack.lock
	UNIX {
		Path /var/run/conntrackd.ctl
		Backlog 20
	}
	NetlinkBufferSize 2097152
	NetlinkBufferSizeMaxGrowth 33554432
	NetlinkOverrunResync Off
	NetlinkEventsReliable On

	Filter From Userspace {
		Protocol Accept {
			TCP
			SCTP
			DCCP
			UDP
			ICMP
			IPv6-ICMP
		}
		Address Ignore {
			IPv4_address 127.0.0.1 # loopback
	}
}
=== cut here ===

-- 
Jiri Kosina <jikos@kernel.org>
SUSE Labs
