From: Chris Tucker <chris.tucker@chiltern-networks.co.uk>
Subject: Suggested improvement for conntrack-tools primary-backup.sh script
Date: Sun, 14 Aug 2016 10:02:22 -0400 (EDT)
Message-ID: <699051644.2017.1471183342262.JavaMail.zimbra@chiltern-networks.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello All,

I have been testing conntrack-tools v1.4.3 (downloaded from www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-1.4.3.tar.bz2).  I want to use it for pairs of High Availability firewalls running in master/backup mode.  In particular, I want to be able to reboot each firewall in turn, without affecting user connections.  However, during testing I found a problem in the way primary-backup.sh works in the case of rebooting the master, which means user connections break.
 
Keepalived and conntrackd are configured in a very standard way, just as recommended in the documentation.  (I can send more details of all configurations if required.)  I have a pair of test hosts either side of the HA pair and the test is to transfer a very large file from one host to the other using passive FTP, while breaking one of the connections between the HA pair in different ways.
 
If I simply bring down an interface on the primary firewall, failover (keepalived and conntrackd) works as expected.  When I bring the interface up again, failback also works as expected.  Apart from a pause of a second or two each time, the FTP session continues unbroken.
 
I had similar successful results when I disconnected and reconnected an Ethernet cable between the HA pair.  Again, the FTP session continued unbroken.
 
However, rebooting didn’t work as expected.  Rebooting the backup is no problem, either when it goes down or when it restarts.  Rebooting the master stopped the FTP transfer permanently.  Although the backup took over when the master went down and the FTP session continued to work, as soon as the original master restarted, the FTP transfer stopped.  Investigation showed that the internal and external connection tracking tables on master and backup were both empty and firewall rules were therefore dropping the “invalid” traffic.  When the original master restarts and runs “primary-backup.sh primary”, it has no cached external entries and so this sequence in the shell script results in the empty connection tracking tables seen:
 
case "$1" in
  primary)
    #
    # commit the external cache into the kernel table
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -c
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -c"
    fi
 
    #
    # flush the internal and the external caches
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -f
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -f"
    fi
 
    #
    # resynchronize my internal cache to the kernel table
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -R
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -R"
    fi
 
    #
    # send a bulk update to backups
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -B
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -B"
    fi
    ;;
 
During the reboot, these entries are created in the /var/log/conntrackd.log file (my asterisks):
 
[Wed Aug  3 08:39:24 2016] (pid=2562) [ERROR] no dedicated links available!
[Wed Aug  3 08:39:24 2016] (pid=2562) [ERROR] no dedicated links available!
[Wed Aug  3 08:39:24 2016] (pid=2562) [ERROR] no dedicated links available!
[Wed Aug  3 08:39:24 2016] (pid=2562) [ERROR] no dedicated links available!
[Wed Aug  3 08:39:25 2016] (pid=2562) [notice] ---- shutdown received ----
[Wed Aug  3 08:42:42 2016] (pid=2558) [notice] using user-space event filtering
[Wed Aug  3 08:42:42 2016] (pid=2558) [notice] netlink event socket buffer size has been set to 2097152 bytes
[Wed Aug  3 08:42:42 2016] (pid=2558) [notice] initialization completed
[Wed Aug  3 08:42:42 2016] (pid=2563) [notice] -- starting in daemon mode --
**[Wed Aug  3 08:42:45 2016] (pid=2563) [notice] committing all external caches**
**[Wed Aug  3 08:42:45 2016] (pid=2563) [notice] Committed 0 new entries       **
[Wed Aug  3 08:42:45 2016] (pid=2563) [notice] commit has taken 0.000647 seconds
[Wed Aug  3 08:42:45 2016] (pid=2563) [notice] flushing caches
[Wed Aug  3 08:42:45 2016] (pid=2563) [notice] resync with master conntrack table
[Wed Aug  3 08:42:45 2016] (pid=2563) [notice] sending bulk update
 
The FTP session stopped as soon as the original master took over.
 
My workaround is a modified primary-backup.sh script.  The first action taken by the original primary as it takes over from the original backup (currently active), should be to re-synchronize:
 
case "$1" in
  primary)
    #
    # request re-synchronization with peer
    # Note: attempt to fix problem after reboot of original master,
    # which had no entries in external cache and so resulted in empty
    # conntrack table
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -n
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -n"
    fi
 
    #
    # commit the external cache into the kernel table
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -c
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -c"
    fi
 
    #
    # flush the internal and the external caches
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -f
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -f"
    fi
 
    #
    # resynchronize my internal cache to the kernel table
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -R
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -R"
    fi
 
    #
    # send a bulk update to backups
    #
    $CONNTRACKD_BIN -C $CONNTRACKD_CONFIG -B
    if [ $? -eq 1 ]
    then
        logger "ERROR: failed to invoke conntrackd -B"
    fi
    ;;
 
This fixed the problem: apart from the usual pause, the FTP session continued to work throughout the reboot.

These entries were created in the /var/log/conntrackd.log file (again, my asterisks):
 
[Wed Aug  3 08:45:36 2016] (pid=2563) [ERROR] no dedicated links available!
[Wed Aug  3 08:45:36 2016] (pid=2563) [ERROR] no dedicated links available!
[Wed Aug  3 08:45:36 2016] (pid=2563) [ERROR] no dedicated links available!
[Wed Aug  3 08:45:36 2016] (pid=2563) [ERROR] no dedicated links available!
[Wed Aug  3 08:45:37 2016] (pid=2563) [notice] ---- shutdown received ----
[Wed Aug  3 08:48:54 2016] (pid=2557) [notice] using user-space event filtering
[Wed Aug  3 08:48:54 2016] (pid=2557) [notice] netlink event socket buffer size has been set to 2097152 bytes
[Wed Aug  3 08:48:54 2016] (pid=2557) [notice] initialization completed
[Wed Aug  3 08:48:54 2016] (pid=2562) [notice] -- starting in daemon mode --
**[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] request resync                **
**[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] committing all external caches**
**[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] Committed 2 new entries       **
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] commit has taken 0.000284 seconds
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] flushing caches
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] resync with master conntrack table
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] sending bulk update
 
The other two cases (restarting interface and disconnecting/reconnecting cable) still worked too.
 
Restart Interface:
[Wed Aug  3 09:04:03 2016] (pid=2562) [notice] flushing conntrack table in 60 secs
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] request resync
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] committing all external caches
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] Committed 2 new entries
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] commit has taken 0.005944 seconds
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] flushing caches
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] resync with master conntrack table
[Wed Aug  3 09:04:27 2016] (pid=2562) [notice] sending bulk update
 
Disconnect/reconnect Cable:
[Wed Aug  3 08:48:54 2016] (pid=2557) [notice] using user-space event filtering
[Wed Aug  3 08:48:54 2016] (pid=2557) [notice] netlink event socket buffer size has been set to 2097152 bytes
[Wed Aug  3 08:48:54 2016] (pid=2557) [notice] initialization completed
[Wed Aug  3 08:48:54 2016] (pid=2562) [notice] -- starting in daemon mode --
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] request resync
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] committing all external caches
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] Committed 2 new entries
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] commit has taken 0.000284 seconds
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] flushing caches
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] resync with master conntrack table
[Wed Aug  3 08:48:58 2016] (pid=2562) [notice] sending bulk update
[Wed Aug  3 09:00:48 2016] (pid=2562) [notice] flushing conntrack table in 60 secs
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] request resync
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] committing all external caches
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] Committed 2 new entries
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] commit has taken 0.000408 seconds
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] flushing caches
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] resync with master conntrack table
[Wed Aug  3 09:01:30 2016] (pid=2562) [notice] sending bulk update

I hope the above is useful to anyone else who needs conntrackd to provide High Availability across reboots.

Best Regards,
Chris.


