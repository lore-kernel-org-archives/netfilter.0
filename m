From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Connection states information tables
Date: Tue, 21 Sep 2004 14:10:29 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41507CA5.7000709@pbl.ca>
References: <20040921185500.GB16833@tranquillitatis.dns2go.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040921185500.GB16833@tranquillitatis.dns2go.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: condor_rl@libero.it
Cc: netfilter@lists.netfilter.org

Lorenzo Rossi wrote:
> My question is:
> How many state tables are used? one table for each main chain?
> One for INPUT and one for OUTPUT?

Only one table is used, regardless of how many tables and/or chains you 
have.  Everything goes into that one table.  Having separate tables, one 
for each chain, wouldn't be of much use (than you couldn't match 
incoming and outgoing packets of single connection, unless you traverse 
all those tables which is just the same as having one table).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

