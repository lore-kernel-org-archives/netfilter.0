Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BC9454
	for <netfilter@vger.kernel.org>; Tue, 26 Nov 2024 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732632382; cv=none; b=tqMK5aM20K98cvqGUjclP52YosT1eotGY9EkZgbxWKeyE7hF2YTn3PZF2E7kzGHl9JhbXTXbQylsfYgQWQRbKJVxoeOVXfEm1+vLYKps4tjKrM7P12HeQPEd7Pi5twl/AaHuBKnNf6rSfPbszu7dYTddwotFDZ/IfUcWlJ/ixPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732632382; c=relaxed/simple;
	bh=6y4d7jutkPywKWQWQOG6TfVSXzYfSIpBhoEyRiWFTDU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=oWlzb+srUOtam5a8r371s8ZgPcTkv6b6ZRgJ1268ffRXGKqCULPLqTS0gucLoTdKwJuS5Tao/iaModdvi0qqz28qtk4kdHi4P3698Z/ZCvQSEIIh/dgrXF9V1EALaAfFmI5yqUPyjk0FMNzSM5/gB7n9QRplASo6D1Bxja2yHsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Upy7Ij14; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Upy7Ij14"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so7539862a12.0
        for <netfilter@vger.kernel.org>; Tue, 26 Nov 2024 06:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732632377; x=1733237177; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6y4d7jutkPywKWQWQOG6TfVSXzYfSIpBhoEyRiWFTDU=;
        b=Upy7Ij144t6nMMhT1Mkq/iJ7y2fFBU6ufCu7afvVp0hijeXt/skc5hl85QfyBkFQbf
         ObHZqDwYbeFw28SH9beU/Lnm8ajIl/2G1DbHYTO4NJ5Fv8cA8NnwH6MAsJrlMXak7Qle
         JAT5DvJHwWQTdBK6TUKNH1wKPpkhgdLhkdX9+vK4SlSW11i3l98z0dfj3rZszgiEwYmc
         Dw1HZ+lza4De+ry+xS/i6lbHGAAyDQiPj4DFxyUzUdvo2hTVZgsJJYh4EKooTJEMYaC5
         wRcOI87nFUGZgnsofzFHWvnBUJYTxPPMSiVXdeAd9/pCK2k+VSiLQsW4vpe0I8hZGyN6
         2W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732632377; x=1733237177;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6y4d7jutkPywKWQWQOG6TfVSXzYfSIpBhoEyRiWFTDU=;
        b=Ba+cx2qudHhDzn2hY3hH77KTjh5kMK8oft0usNOtqSqetkMLcJw7E6d3KXyJ8H2WM2
         pdFPsW3ejYE3OAsrKMY+dg/XoyjPvzfJLimEnZEKneHMUVIkHunHqcIwLWNsmBGnGyS4
         m8a8y5zanUcXBVW19T8UbG4GSKZZ/937oJvu5TBik+briS9nUxiRkYfgCIJSR0OdV1NV
         M+S1BQ+SAvNvYqcleOTzlNCVe8mytDRetIXafqPi1LVGT4RdBzwO26zJH8PgxylI/GdE
         HIZ03x2jfxtHN1ouf9O/gqvUHlGnKfnQLD6l2/WUsbeJPQA+6eo+5TluxrU7i8TYRLB2
         e4jA==
X-Gm-Message-State: AOJu0YyqDVqCp5WieTctIyClV7ue45LNJvFPoeOLBo3+LyG2nFRyi/fx
	IxH4/Fd/ObZ5JqzyYjXGxHHj60beviKj3A/4Eg59LWIehtPPzPuQcQwf88S8Z/YqTNUilMXfMZx
	Id7LT7WZ7DFK+PjAqal9kyLcAXmelLXSh
X-Gm-Gg: ASbGncut66CG21HL1r7YTkOGLc5BV3LmChlWH92uuEDVsCxVhgMHhg4c3k6vvCCxhUR
	4Xvd6BVTBA7HBceMsQTxlFQzoCkqX3yPSlg==
X-Google-Smtp-Source: AGHT+IHpRApHBEqnkrrQbybqr6XJ4abibfzXAOhWEIO9oQDwlVz5T4OIgoEGalVRFJ4mGVhLRc4RrunwOUSmekiZ/uI=
X-Received: by 2002:a05:6402:274b:b0:5cf:c188:81bd with SMTP id
 4fb4d7f45d1cf-5d0205f4d68mr13343109a12.9.1732632377450; Tue, 26 Nov 2024
 06:46:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mokhtar BEN MESSAOUD <mbmessaoud@gmail.com>
Date: Tue, 26 Nov 2024 15:46:06 +0100
Message-ID: <CA+ue7ODTfHtt2q6adeg_QUtGz+Ucieh9d5yFSiDDdXnsXzFhkw@mail.gmail.com>
Subject: [DNAT] Port forwarding with Port range
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

is it possible to use iptables to define a rule to make a port
forwarding of a range of ports
For example :
iptables -t nat -A PREROUTING -p tcp --dport 1000:2000 -j DNAT
--to-destination 192.168.1.100:3000-4000

so traffic for port 1000 will be redirected to port 3000
and traffic for port 1000+n ==> 3000+N
