From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: [OT] Linux user logging
Date: Fri, 16 Jul 2004 09:49:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F7EAE9.4070800@pbl.ca>
References: <20040715151459.6a8106e6@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040715151459.6a8106e6@mgalepc.utilitran.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

Michael Gale wrote:
> Hello,
> 
> 	I know this is not a netfilter question but I was wondering if any one knows of a way to log all user activity. So if a
> user logs in via a SSH connection I would like to log all user activity. What files the view or alter and any other
> commands ?

Yup, completely OT for this mailing list...

What you are looking for is called auditing.  There are some projects 
for implementing it on Linux, but AFAIK nothing final and stable.  If I 
understood it correctly (and I might be completely wrong here), the 
major problem is that core group of Linux kernel developers is reluctant 
in putting appropriate auditing hooks into kernel (not even as an 
compile time option for those that need it), for whatever reason.

Note that good auditing is not trivial to configure, and depending on 
what you want to log, auditing can produce *huge* log files.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

