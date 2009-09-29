From: "Nguyen Anh Dung" <serepok@gmail.com>
Subject: Cannot access to CVS server of Patch-O-Matic
Date: Tue, 29 Sep 2009 08:40:40 +0700
Message-ID: <4ac1659d.20015a0a.15da.ffffe6ff@mx.google.com>
References: <B7A55E8C969B974FBC89274E565B8B2D019DFBCA0A@US-COL-EXCHMBX1.green.sophos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:subject
         :date:mime-version:content-type:content-transfer-encoding:x-mailer
         :in-reply-to:x-mimeole:thread-index;
        bh=3Cdu/a58FbH9TpVW2uu7W39sh2GuZ55YcIvFEx0EUq8=;
        b=UPQTncugBDl95lyxGkI7xAXSYJGjMYNQglO+4qw5T9uhSKYbSyZuPyHMzL8V7iC4b4
         V/XFn9d2fL4hLq8RQI+7CU81exacfbVqTCjjOzYUckVD9u48MblEqAgjYpxBndLYNDhh
         RaNF9paRuX0DstYbvHylOeJljJ9w8Bn3vhNDk=
In-Reply-To: <B7A55E8C969B974FBC89274E565B8B2D019DFBCA0A@US-COL-EXCHMBX1.green.sophos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,
I'm doing firewall testing which is related to time-based features of
iptables. As suggested from many sources, I try to use Patch-O-Matic to
install that feature. First, I must connect to the pserver.netfilter.org

# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login

(When it asks you for a password type `cvs').

I got the following error:
cvs [login aborted]: connect to pserver.netfilter.org(213.95.27.115):2401
failed: Connection refused.

I don't understand why, I used password 'cvs' as suggested.

So I just need to know if this server is still working (I ping it and get
response)? And anybody has used it successfully?

Thanks in advanced.

Nguyen Anh Dung.

