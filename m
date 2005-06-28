From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Tue, 28 Jun 2005 02:10:28 -0500
Message-ID: <42C0F7E4.4060805@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Ok, it looks like there is some renewed interest in the "SSH Brute Force" chain as it was.  I have taken requests and recommendations of others on this mail list and have grown the "SSH Brute Force" chain to be a MUCH more complex rule set (it's now more than one chain so I can't call it a chain any more) that has MUCH more capability.  I have put a version number of 20050628.0 in the subject line so that we can keep track of this on the mail list as the last time I posted this it got to be quite a thread with many versions.

The idea behind this version is accomplish the following:
1)  Have a way to detect and block a particular SSH connection based on a duration of time.
2)  Enforce a "Quite Time" of a specified duration before a connection is allowed to be established or restart the counter on the "Quite Time".
3)  Only allow someone to ""trip a trigger for a particular time window a specified number of times or else they ""trip a trigger for the next larger time window.
4)  Provide the capability of "Black Listing" of IPs.  I have not completely implemented this in this version but it would be very easy to have a global Black List based on the "SSH_Blacklist" recent list.
5)  Have a known string to search for in the logs to look for IPs that need to be added to /etc/hosts.deny.  At present I have not written any thing to do this monitoring, I leave that up to you.  That is unless you ask for help.

So with out further a due:

#!/bin/bash
IPTablesPath=/usr/sbin
IPTablesBin=iptables
IPTablesCount=0
IPTablesErrorCount=0

function iptables () {
                IPTablesCommand[IPTablesCount]=`echo ${IPTablesBin} "${@}" | sed -e 's/  //g'`
                IPTablesError[IPTablesCount]=`${IPTablesPath}/${IPTablesBin} "${@}" 2>&1`
                if test $? -eq 0; then {
                        echo -n "."
                }; else {
                        echo -n "x"
                        IPTablesCommand[++IPTablesCount]=""
                }; fi
}



#
# iptables-chainprobe is a small function that I wrote to allow me to write my firewall scripts with out worrying if a chain exists or not, much like modprobe for kernel modules, hens the name.
#
function iptables-chainprobe () {
        if test "${1}" == "-t" -o "${1}" == "--table"; then {
		# Insert some logic to test to make sure that all required parameters were passed.
                if test "${2}" == "filter" -o "${2}" == "nat" -o "${2}" == "mangle" -o "${2}" == "raw"; then {
                        if test -n "${3}"; then {
                                if test -n "${4}"; then {
                                        case ${3} in
                                                "-N"|"--new-chain")
                                                        iptables-save -t ${2} | fgrep ":${4} -" > /dev/null
                                                        if test $? -ne 0; then {
                                                                iptables -t ${2} -N ${4}
                                                        }; else {
                                                                iptables -t ${2} -F ${4}
                                                        }; fi
                                                        ;;
                                                "-F"|"--flush")
                                                        iptables-save -t ${2} | fgrep ":${4} -" > /dev/null
                                                        if test $? -eq 0; then {
                                                                iptables -t ${2} -F ${4}
                                                        }; else {
                                                                iptables -t ${2} -N ${4}
                                                        }; fi
                                                        ;;
                                                # Insert more of the actions that can be taken on various chains,
                                                # -X / --delete-chain, 
                                                # -Z / --zero-chain, 
                                                # -P / --policy
                                                        # Only allow setting policies on non-userdefined chains.
                                                # -E / --rename-chain
                                                # Put these actions in alphabetical order.
                                        esac
                                }; else {
                                        echo -n "x"
                                        IPTablesCommand[IPTablesCount]=`echo iptables-chainprobe "${@}" | sed -e 's/  //g'`
                                        IPTablesError[IPTablesCount]="Error text for not specifying a chain goes here."
                                        IPTablesCommand[++IPTablesCount]=""
                                }; fi
                        }; else {
                                echo -n "x"
                                IPTablesCommand[IPTablesCount]=`echo iptables-chainprobe "${@}" | sed -e 's/  //g'`
                                IPTablesError[IPTablesCount]="Error text for not specifying an action for the chain goes here."
                                IPTablesCommand[++IPTablesCount]=""
                        }; fi
                }; else {
                        echo -n "x"
                        IPTablesCommand[IPTablesCount]=`echo iptables-chainprobe "${@}" | sed -e 's/  //g'`
                        IPTablesError[IPTablesCount]="Error text for not specifying a valid table goes here."
                        IPTablesCommand[++IPTablesCount]=""
                }; fi
        }; else {
                echo -n "x"
                IPTablesCommand[IPTablesCount]=`echo iptables-chainprobe "${@}" | sed -e 's/  //g'`
                IPTablesError[IPTablesCount]="Error text for not specifying \"-t\" or \"--table\" goes here."
                IPTablesCommand[++IPTablesCount]=""
        }; fi
}



function iptables-errors () {
        if test ${IPTablesCount} -gt 0; then {
                if test ${IPTablesCount} -eq 1; then {
                        echo "There was 1 error with your firewall script.  The error is listed below."
                }; else {
                        echo "There were ${IPTablesCount} errors with your firewall script.  The errors are listed below."
                }; fi
                for ((x=0;x<IPTablesCount;x++)); do {
                        echo -e "Command:\t${IPTablesCommand[$x]}"
                        echo ${IPTablesCommand[$x]} | egrep -e "(-m|--match) comment" > /dev/null
                        if test $? -eq 0; then {
                                echo -e "   Note:\tComment match extension comments do not show up with double quotes in the \"Error:\" line below.  (Bug)."
                        }; fi
                        echo -e "  Error:\t${IPTablesError[$x]}"
                }; done
        }; fi
}



echo -n "Setting up the firewall"



#
# Filter Table SSH_Brute_Force_2678400 Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force_2678400
iptables -t filter -A SSH_Brute_Force_2678400 -m recent --rcheck --seconds 604800 --hitcount 2 --name SSH_Brute_Force_86400 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_2678400 -m recent ! --rcheck --seconds 2678400 --hitcount 2 --name SSH_Brute_Force_2678400 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_2678400 -m recent --name SSH_Blacklist --set --rsource
iptables -t filter -A SSH_Brute_Force_2678400 -j LOG --log-prefix "SSH Blacklist:  "
iptables -t filter -A SSH_Brute_Force_2678400 -p tcp -j REJECT



#
# Filter Table SSH_Brute_Force_604800 Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force_604800
iptables -t filter -A SSH_Brute_Force_604800 -m recent --rcheck --seconds 86400 --hitcount 2 --name SSH_Brute_Force_3600 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_604800 -m recent ! --rcheck --seconds 604800 --hitcount 2 --name SSH_Brute_Force_86400 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_604800 -m recent --name SSH_Brute_Force_2678400 --set --rsource
iptables -t filter -A SSH_Brute_Force_604800 -j LOG --log-prefix "SSH Brute Force (604800):  "
iptables -t filter -A SSH_Brute_Force_604800 -p tcp -j REJECT



#
# Filter Table SSH_Brute_Force_86400 Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force_86400
iptables -t filter -A SSH_Brute_Force_86400 -m recent --rcheck --seconds 3600 --hitcount 5 --name SSH_Brute_Force_60 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_86400 -m recent ! --rcheck --seconds 86400 --hitcount 2 --name SSH_Brute_Force_3600 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_86400 -m recent --name SSH_Brute_Force_86400 --set --rsource
iptables -t filter -A SSH_Brute_Force_86400 -j LOG --log-prefix "SSH Brute Force (86400):  "
iptables -t filter -A SSH_Brute_Force_86400 -p tcp -j REJECT



#
# Filter Table SSH_Brute_Force_3600 Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force_3600
iptables -t filter -A SSH_Brute_Force_3600 -m recent --rcheck --seconds 60 --hitcount 3 --name SSH_Brute_Force --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_3600 -m recent ! --rcheck --seconds 3600 --hitcount 5 --name SSH_Brute_Force_60 --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_3600 -m recent --name SSH_Brute_Force_3600 --set --rsource
iptables -t filter -A SSH_Brute_Force_3600 -j LOG --log-prefix "SSH Brute Force (3600):  "
iptables -t filter -A SSH_Brute_Force_3600 -p tcp -j REJECT



#
# Filter Table SSH_Brute_Force_60 Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force_60
iptables -t filter -A SSH_Brute_Force_60 -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH_Brute_Force --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_60 -m recent --name SSH_Brute_Force_60 --set --rsource
iptables -t filter -A SSH_Brute_Force_60 -j LOG --log-prefix "SSH Brute Force (60):  "
iptables -t filter -A SSH_Brute_Force_60 -p tcp -j REJECT



#
# Filter Table SSH_Brute_Force_1 Chain
#
# This is not the cleanest way to handle multiple SSH connections per second, but it will work by artificially tripping SSH_Brute_Force_60.
iptables-chainprobe -t filter -F SSH_Brute_Force_1
iptables -t filter -A SSH_Brute_Force_1 -m recent ! --rcheck --seconds 1 --hitcount 2 --name SSH_Brute_Force --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force_1 -m recent --name SSH_Brute_Force --set --rsource
iptables -t filter -A SSH_Brute_Force_1 -j LOG --log-prefix "SSH Brute Force (1):  "
iptables -t filter -A SSH_Brute_Force_1 -p tcp -j REJECT



#
# Filter Table SSH_Brute_Force_NEW Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force_NEW
iptables -t filter -A SSH_Brute_Force_NEW -m recent --name SSH_Brute_Force --set --rsource
iptables -t filter -A SSH_Brute_Force_NEW -j SSH_Brute_Force_2678400
iptables -t filter -A SSH_Brute_Force_NEW -j SSH_Brute_Force_604800
iptables -t filter -A SSH_Brute_Force_NEW -j SSH_Brute_Force_86400
iptables -t filter -A SSH_Brute_Force_NEW -j SSH_Brute_Force_3600
iptables -t filter -A SSH_Brute_Force_NEW -j SSH_Brute_Force_60
iptables -t filter -A SSH_Brute_Force_NEW -j SSH_Brute_Force_1



##
## Filter Table SSH_Brute_Force_ESTABLISHED Chain
##
#iptables-chainprobe -t filter -F SSH_Brute_Force_ESTABLISHED
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force_1 --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force_60 --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force_3600 --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force_86400 --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force_604800 --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Brute_Force_2678400 --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Blacklist --remove --rsource
#iptables -t filter -A SSH_Brute_Force_ESTABLISHED -m recent --name SSH_Known_Good --set --rsource



#
# Filter Table SSH_Brute_Force Chain
#
iptables-chainprobe -t filter -F SSH_Brute_Force
#iptables -t filter -A SSH_Brute_Force -m recent --name SSH_Known_Good --rcheck --rsource -j RETURN
iptables -t filter -A SSH_Brute_Force -s 208.47.119.113 -j RETURN
iptables -t filter -A SSH_Brute_Force -s 208.47.119.114 -j RETURN
iptables -t filter -A SSH_Brute_Force -s 208.47.119.115 -j RETURN
iptables -t filter -A SSH_Brute_Force -s 208.47.119.116 -j RETURN
iptables -t filter -A SSH_Brute_Force -s 208.47.119.117 -j RETURN
iptables -t filter -A SSH_Brute_Force -m state --state NEW -j SSH_Brute_Force_NEW
# I don't have support for connbytes in my kernel (yet) so I cant run this test.  :(
#iptables -t filter -A SSH_Brute_Force -m state --state ESTABLISHED -m connbytes --connbytes 10000 -j SSH_Brute_Force_ESTABLISHED



echo "done."
iptables-errors

The basic logic behind this script is as follows:
 1)  Jump to the "SSH_Brute_Force" chain from somewhere else in your firewall.
 2)  Jump to the "SSH_Brute_Force_NEW" chain if the connection is considered to be NEW by conntrack.
 3)  Jump to the "SSH_Brute_Force_ESTABLISHED" chain if the connection is considered to be ESTABLISHED by conntrack.
     This chain should clear any and all recent lists related to SSH_Brute_Force for this connection save for the SSH_Known_Good recent list, for which it should set it.
 4)  The "SSH_Brute_Force_NEW" chain will then jump to the various sub chains to determine if a connection is being blocked for any specific duration of time.
 5)  The SSH_Brute_Force_[0-9]* chains will test to see if a connection is being banned for the next lower amount of time and not process if this is the case and defer processing to the chain that is doing the banning.
 6)  If a SSH_Brute_Force_[0-9]* chain does see that a packet has been banned by the next shorter duration chain but is not presently banned check to see how many times it has been banned for the next shorter duration.  If the count of the number of times the next shorter ban is over a specified number ban the connection for a longer duration.
     Translation, if I ban a connection for 60 seconds more than two times an hour ban them for an hour.  If I ban them for an hour more than once a day ban them for a day, etc.

One point of interest would be the use of the "--rttl" option on the recent matches.  I have not tested such tests but plan to do so in the future.  Please reply to the mail list with your experiences.

As always any comments and / or suggestions are most welcome and appreciated.



Grant. . . .

