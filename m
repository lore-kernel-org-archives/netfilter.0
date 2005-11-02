From: karl@klxsystems.net
Subject: Adjusting TOS/ Precedence/  in IPTables
Date: Wed, 2 Nov 2005 13:20:59 -0800 (PST)
Message-ID: <1843.66.125.65.130.1130966481.squirrel@www.klxsystems.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: abhijit.majumdar@pivotalsys.com, sherk.chung@pivotalsys.com, rusty@rustcorp.co.au

Hi Rusty, Netfilter list,

Our setup:

Tool Machine ------- Analysis Machine ------ Host/Controller Machine

Our Need:

All we want is to make the duplicate packets look like they are coming
from the host so the tool does not know about the analysis (middle/bridge)
machine.

In order to do that we have to change the source Ip/ port and precendence
/ security / compartment.  How is this done in IPTables?

Specific Notes:
We don't need/use a 3 way connection.

Note that when analysis machine can successfully connect to the TCP
server, the host still sends packets towards the tool, but since the
analysis machine is in between them, it receives the packet, processes it
and sends a duplicate packet towards the tool server.

Note:  it is a duplicate packet, not the original one since in the
analysis machine software we are dealing with a higher level protocol
(HSMS over TCP) and the modules of the software that deal with the tool
communication and host communication are independent. This is a given and
cannot be changed.

Step-by-step details of communication:

We have a machine (analysis) sitting in between two other machines
(tool/host-controller).

Phase 1:  Tool and Host/Controller are communicating.

Phase 2:  Direct connection between Tool/Controller is changed, via a
shunting feature in the NIC cards, to now send traffic through the
ethernet ports 1/2 of the Analysis machine sititng in the middle.

Phase 3: Information going between the Tool/Host continues through this
bridge/analysis machine, so that the tool/host don't know about the
middle/bridge/analysis machine.  This information is then fed to various
software on the analysis machine, and used to effect better chip etching
production.

Phase 4:  Analysis concludes, the middle/bridge/Analysis machine 'hangs
up', and the DIRECT communication between the Tool/Host-Controller
machines resumes, all without violating RFC 798.

