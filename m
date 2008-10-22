From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: error with iptables-restore
Date: Wed, 22 Oct 2008 09:15:46 -0700
Message-ID: <48ff51b5.9e03be0a.322c.6589@mx.google.com>
References: <003301c9344d$29ffb5c0$7dff2140$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :message-id;
        bh=3cc7v8UjRE+dow5bAoATnY1eCq1mZ6nmEgCF3LgsiKs=;
        b=Hz/nZjsWMFtrUDnFSU3cCHD4cOAhH2wDlVXKK4f2zTP5Yxa4arEUL3j0UfdeZu59tp
         wr7rhpGpJLHWwlYesk/t2c9nZPVoJASK2WNGovOdKjrSU5Q7e/z1hB7mwhQTK3mKapMn
         pxHpLi+Ay97YXymrVQco96Ui+gv95snUrzX9Q=
In-Reply-To: <003301c9344d$29ffb5c0$7dff2140$@net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'IPTables' <netfilter@vger.kernel.org>

"File Exists" usually means an identical entry (not necessarily a file)
already exists.
The same chain is already defined in line 9027

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Joey
> Sent: Wednesday, October 22, 2008 6:51 AM
> To: IPTables
> Subject: error with iptables-restore
> 
> Hello Everyone,
> 
> 
> 
> I have been working on getting my ip list to be written to a save file,
> and
> it looks good, but I get this error when restoring:
> 
> 
> 
> iptables-restore v1.3.5: error creating chain 'CIDR-TURKEY':File exists
> 
> Error occurred at line: 9945
> 
> 
> 
> No there are 20 other chains that are generated prior to this one in
> exactly
> the same way, and there are several chains that load PRIOR to this one,
> so I
> know I don't have a syntax issue.
> 
> 
> 
> Line 9945 has this:
> 
> :CIDR-TURKEY - [0:0]
> 
> 
> 
> Which looks exactly the same as every other chain creation line.
> 
> 
> 
> I have linked the entire generated text file ( restore formatted file )
> here
> <http://web56.net/TEST-IP-TABLES>
> 
> 
> 
> 
> 
> Sorry to be such a newb..
> 
> 
> 
> Thanks!
> 
> Joey
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

